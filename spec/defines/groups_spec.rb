#!/usr/bin/env rspec
require 'spec_helper'

describe 'groups', :type => :define do

  describe 'test simple group hash' do

    let :title do
      'bar'
    end
    let :params do
      { 'hash ' => { 'foo' => { 'gid' => '123' } } }
    end

    it { should contain_groups('bar') }
    it { should contain_groups__setup('foo').with_hash({"foo"=>{"gid"=>"123"}}) }
    it { should contain_group('foo').with_gid(123) }
  end

  describe 'hiera specified simple group hash' do
    let :title do
      'bar'
    end

    let(:hiera_data) do
      { 'groups_bar' => {'foo' => { 'gid' => '123' } } }
    end

    it { should contain_groups('bar') }
    it { should contain_groups__setup('foo').with_hash({"foo"=>{"gid"=>"123"}}) }
  end
end
