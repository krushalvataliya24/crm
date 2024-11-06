@extends('laravel-crm::layouts.app')

@section('content')

<form method="POST" action="{{ url(route('laravel-crm.email-config.store')) }}">
    @csrf
    <div class="container-fluid pl-0">
        <div class="row">
            <div class="col col-md-2">
                <div class="card">
                    <div class="card-body py-3 px-2">
                        @include('laravel-crm::layouts.partials.nav-settings')
                    </div>
                </div>
            </div>
            <div class="col col-md-10">
                <div class="card">
                    <div class="card-header">
                        <h3 class="card-title float-left m-0">Email Settings</h3>
                        <span class="float-right">
                            <a type="button" class="btn btn-outline-secondary btn-sm" href="{{ url(route('laravel-crm.email-config.index')) }}">
                                <span class="fa fa-angle-double-left"></span> Back to Email Config
                            </a>
                        </span>
                    </div>
                    <div class="card-body">
                         <!-- Display global errors -->
                         @if(session('error'))
                            <div class="alert alert-danger">
                                {{ session('error') }}
                            </div>
                        @endif

                        <!-- Validation Errors -->
                        @if($errors->any())
                            <div class="alert alert-danger">
                                <ul>
                                    @foreach($errors->all() as $error)
                                        <li>{{ $error }}</li>
                                    @endforeach
                                </ul>
                            </div>
                        @endif
                        <div class="row">
                        <div class="col">
                            <div class="form-group row">
                                <!-- Protocol -->
                                <div class="col-md-2">
                                    <label for="protocol">Protocol</label>
                                    <select id="protocol" name="protocol" class="form-control custom-select">
                                        <option value="SMTP" {{ old('protocol') == 'SMTP' ? 'selected' : '' }}>SMTP</option>
                                        <option value="POP3" {{ old('protocol') == 'POP3' ? 'selected' : '' }}>POP3</option>
                                        <option value="IMAP" {{ old('protocol') == 'IMAP' ? 'selected' : '' }}>IMAP</option>
                                    </select>
                                </div>

                                <!-- Host -->
                                <div class="col-md-6">
                                    <label for="host">Host / Server</label>
                                    <input type="text" id="host" name="host" value="{{ old('host') }}" class="form-control" required>
                                </div>

                                <!-- SSL/TLS -->
                                <div class="col-md-1">
                                    <label for="ssl_tls">SSL/TLS</label>
                                    <select id="ssl_tls" name="ssl_tls" class="form-control custom-select">
                                        <option value="SSL" {{ old('ssl_tls') == 'SSL' ? 'selected' : '' }}>SSL</option>
                                        <option value="TLS" {{ old('ssl_tls') == 'TLS' ? 'selected' : '' }}>TLS</option>
                                    </select>
                                </div>

                                <!-- Port -->
                                <div class="col-md-3">
                                    <label for="port">Port</label>
                                    <input type="number" id="port" name="port" value="{{ old('port') }}" class="form-control" required>
                                </div>
                            </div>
                            <!-- Username -->
                            <div class="form-group">
                                <label for="username">Username</label>
                                <input type="text" id="username" name="username" value="{{ old('username') }}" class="form-control" required>
                            </div>

                            <!-- Password -->
                            <div class="form-group">
                                <label for="password">Password</label>
                                <input type="password" id="password" name="password" value="{{ old('password') }}" class="form-control" required>
                            </div>
                        </div>

                        </div>
                    </div>
                    <div class="card-footer">
                        <a href="{{ url(route('laravel-crm.email-config.index')) }}" class="btn btn-outline-secondary">Cancel</a>
                        <button type="submit" class="btn btn-primary">Save Changes</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</form>

@endsection
