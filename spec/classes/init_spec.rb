require 'spec_helper'

describe 'duplicity' do
  let(:title) { 'duplicity' }

  describe 'by default' do
    let(:params) { {} }

    it { should contain_package('duplicity').with(
        'ensure'   => 'installed',
        'name'     => 'duplicity'
      )
    }
    it { should contain_package('duply').with(
        'ensure'   => 'installed',
        'name'     => 'duply'
      )
    }
  end

  describe 'with duplicity_package_ensure => 1.2.3' do
    let(:params) { {:duplicity_package_ensure => '1.2.3'} }

    it { should contain_package('duplicity').with_ensure('1.2.3') }
  end

  describe 'with duplicity_package_ensure => 0.6.18-3~bpo60+1' do
    let(:params) { {:duplicity_package_ensure => '0.6.18-3~bpo60+1'} }

    it { should contain_package('duplicity').with_ensure('0.6.18-3~bpo60+1') }
  end

  describe 'with empty duplicity_package_ensure' do
    let(:params) { {:duplicity_package_ensure => ''} }

    it do
      expect { should contain_package('duplicity') }.to raise_error(Puppet::Error, /package_ensure/)
    end
  end

  describe 'with duplicity_package_name => foobar' do
    let(:params) { {:duplicity_package_name => 'foobar'} }

    it { should contain_package('duplicity').with_name('foobar') }
  end

  describe 'with empty duplicity_package_name' do
    let(:params) { {:duplicity_package_name => ''} }

    it do
      expect { should contain_package('duplicity') }.to raise_error(Puppet::Error, /package_name/)
    end
  end

  describe 'with duply_package_ensure => 1.2.3' do
    let(:params) { {:duply_package_ensure => '1.2.3'} }

    it { should contain_package('duply').with_ensure('1.2.3') }
  end

  describe 'with duply_package_ensure => 0.6.18-3~bpo60+1' do
    let(:params) { {:duply_package_ensure => '0.6.18-3~bpo60+1'} }

    it { should contain_package('duply').with_ensure('0.6.18-3~bpo60+1') }
  end

  describe 'with empty duply_package_ensure' do
    let(:params) { {:duply_package_ensure => ''} }

    it do
      expect { should contain_package('duply') }.to raise_error(Puppet::Error, /package_ensure/)
    end
  end

  describe 'with duply_package_name => foobar' do
    let(:params) { {:duply_package_name => 'foobar'} }

    it { should contain_package('duply').with_name('foobar') }
  end

  describe 'with empty duply_package_name' do
    let(:params) { {:duply_package_name => ''} }

    it do
      expect { should contain_package('duply') }.to raise_error(Puppet::Error, /package_name/)
    end
  end
end
