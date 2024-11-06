<?php

namespace VentureDrake\LaravelCrm\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class UpdateEmailConfigRequest extends FormRequest
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
            'protocol' => 'required|in:SMTP,POP3,IMAP',  // Ensure protocol is one of the allowed values
            'host' => 'required|string|max:255',  // Host should be a string and cannot exceed 255 characters
            'ssl_tls' => 'required|in:SSL,TLS',  // SSL/TLS should be either SSL or TLS
            'port' => 'required|integer|min:1|max:65535',  // Port should be a valid integer within the valid range
            'username' => 'required|string|max:255',  // Username should be a string and cannot exceed 255 characters
            'password' => 'nullable|string|min:6',  // Password is optional but, if provided, must be at least 6 characters long
        ];
    }

    /**
     * Custom error messages for validation rules.
     *
     * @return array
     */
    public function messages()
    {
        return [
            'protocol.required' => 'Please select the email protocol (SMTP, POP3, or IMAP).',
            'protocol.in' => 'Invalid protocol selected. Please choose either SMTP, POP3, or IMAP.',
            'host.required' => 'The host/server address is required.',
            'host.string' => 'The host must be a valid string.',
            'host.max' => 'The host cannot exceed 255 characters.',
            'ssl_tls.required' => 'Please select the SSL/TLS option.',
            'ssl_tls.in' => 'Invalid selection for SSL/TLS. Please choose either SSL or TLS.',
            'port.required' => 'The port number is required.',
            'port.integer' => 'The port number must be a valid integer.',
            'port.min' => 'The port number must be between 1 and 65535.',
            'port.max' => 'The port number must be between 1 and 65535.',
            'username.required' => 'The username is required.',
            'username.string' => 'The username must be a valid string.',
            'username.max' => 'The username cannot exceed 255 characters.',
            'password.string' => 'The password must be a valid string.',
            'password.min' => 'The password must be at least 6 characters long.',
        ];
    }
}
