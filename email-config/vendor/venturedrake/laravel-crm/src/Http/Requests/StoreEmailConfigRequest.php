<?php

namespace VentureDrake\LaravelCrm\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class StoreEmailConfigRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     *
     * @return bool
     */
    public function authorize()
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array
     */
    public function rules()
    {
        return [
            'protocol' => 'required|in:SMTP,POP3,IMAP',
            'host' => 'required|string|max:255',
            'ssl_tls' => 'required|in:SSL,TLS',
            'port' => 'required|integer|min:1|max:65535',
            'username' => 'required|string|max:255',
            'password' => 'required|string|min:6',  // Adjust minimum length as needed
        ];
    }

    /**
     * Custom messages for validation rules.
     *
     * @return array
     */
    public function messages()
    {
        return [
            'protocol.required' => 'Please select the email protocol.',
            'protocol.in' => 'Invalid protocol selected. Please choose SMTP, POP3, or IMAP.',
            'host.required' => 'The host / server is required.',
            'host.string' => 'The host must be a valid string.',
            'host.max' => 'The host cannot exceed 255 characters.',
            'ssl_tls.required' => 'Please select either SSL or TLS for secure connection.',
            'ssl_tls.in' => 'Invalid selection for SSL/TLS. Please choose SSL or TLS.',
            'port.required' => 'The port number is required.',
            'port.integer' => 'The port number must be an integer.',
            'port.min' => 'The port number must be between 1 and 65535.',
            'port.max' => 'The port number must be between 1 and 65535.',
            'username.required' => 'The username is required.',
            'username.string' => 'The username must be a valid string.',
            'username.max' => 'The username cannot exceed 255 characters.',
            'password.required' => 'The password is required.',
            'password.string' => 'The password must be a valid string.',
            'password.min' => 'The password must be at least 6 characters long.',
        ];
    }
}
