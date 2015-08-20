require 'spec_helper'

describe ResponseCallback do
  it 'has a version number' do
    expect(ResponseCallback::VERSION).not_to be nil
  end
  context 'without var yielding' do
    before do
      class AClass
        def self.a_complex_operation(success:)
          if success
            yield ResponseCallback::Success.new
          else
            yield ResponseCallback::Fail.new
          end
        end
      end
    end

    it 'goes to success path when successfull' do
      success_path = ''
      AClass.a_complex_operation(success: true) do |response|
        response.on_success do
          success_path = 'entered'
        end
        response.on_fail do
          success_path = 'not_entered'
        end
      end
      expect(success_path).to eq 'entered'
    end

    it 'goes to fail path when failure' do
      fail_path = ''
      AClass.a_complex_operation(success: false) do |response|
        response.on_success do
          fail_path = 'not_entered'
        end
        response.on_fail do
          fail_path = 'entered'
        end
      end
      expect(fail_path).to eq 'entered'
    end
  end

  context 'with var yielding' do
    before do
      class AClass
        def self.a_complex_operation(success:)
          if success
            yield ResponseCallback::Success.new(yield_var: 'an_object')
          else
            yield ResponseCallback::Fail.new(yield_var: 'an_error')
          end
        end
      end
    end

    it 'returns given var on success' do
      a_var = ''
      AClass.a_complex_operation(success: true) do |response|
        response.on_success do |var|
          a_var = var
        end
        response.on_fail do
          expect(true).to eq false
        end
      end
      expect(a_var).to eq 'an_object'
    end

    it 'returns given var on error' do
      a_var = ''
      AClass.a_complex_operation(success: false) do |response|
        response.on_success do |_var|
          expect(true).to eq false
        end
        response.on_fail do |var|
          a_var = var
        end
      end
      expect(a_var).to eq 'an_error'
    end
  end
end
