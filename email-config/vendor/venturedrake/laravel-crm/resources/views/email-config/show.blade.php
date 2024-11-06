@extends('laravel-crm::layouts.app')
@section('content')

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
                        <h3 class="mb-0"> {{ $email->name }} <span class="float-right">
                            <a type="button" class="btn btn-outline-secondary btn-sm" href="{{ url(route('laravel-crm.email-config.index')) }}"><span class="fa fa-angle-double-left"></span> {{ ucfirst(__('laravel-crm::lang.back_to_labels')) }}</a> | 
                            @can('edit crm labels')
                                                <a href="{{ url(route('laravel-crm.email-config.edit', $email)) }}" type="button" class="btn btn-outline-secondary btn-sm"><span class="fa fa-edit" aria-hidden="true"></span></a>
                                            @endcan
                                            @can('delete crm labels')
                                                <form action="{{ route('laravel-crm.email-config.destroy',$email) }}" method="POST" class="form-check-inline mr-0 form-delete-button">
                                                {{ method_field('DELETE') }}
                                                                    {{ csrf_field() }}
                                                <button class="btn btn-danger btn-sm" type="submit" data-model="{{ __('laravel-crm::lang.label') }}"><span class="fa fa-trash-o" aria-hidden="true"></span></button>
                                            </form>
                                            @endcan
                        </span></h3>
                    </div>
                    <div class="card-body">
                        <div class="row">
                        <div class="col-sm-5">
                            <h6 class="text-uppercase">{{ ucfirst(__('laravel-crm::lang.details')) }}</h6>
                            <hr />
                            <dl class="row">
                                <!-- Protocol -->
                                <dt class="col-sm-3 text-right">{{ ucfirst(__('laravel-crm::lang.protocol')) }}</dt>
                                <dd class="col-sm-9">{{ $email->protocol }}</dd>

                                <!-- Host/Server -->
                                <dt class="col-sm-3 text-right">{{ ucfirst(__('laravel-crm::lang.host')) }}</dt>
                                <dd class="col-sm-9">{{ $email->host }}</dd>

                                <!-- SSL/TLS -->
                                <dt class="col-sm-3 text-right">{{ ucfirst(__('laravel-crm::lang.ssl_tls')) }}</dt>
                                <dd class="col-sm-9">{{ $email->ssl_tls }}</dd>

                                <!-- Port -->
                                <dt class="col-sm-3 text-right">{{ ucfirst(__('laravel-crm::lang.port')) }}</dt>
                                <dd class="col-sm-9">{{ $email->port }}</dd>

                                <!-- Username -->
                                <dt class="col-sm-3 text-right">{{ ucfirst(__('laravel-crm::lang.username')) }}</dt>
                                <dd class="col-sm-9">{{ $email->username }}</dd>

                                <!-- Password -->
                                <dt class="col-sm-3 text-right">{{ ucfirst(__('laravel-crm::lang.password')) }}</dt>
                                <dd class="col-sm-9">******</dd> <!-- Hide password for security reasons -->

                                <!-- Created At -->
                                <dt class="col-sm-3 text-right">{{ ucfirst(__('laravel-crm::lang.created')) }}</dt>
                                <dd class="col-sm-9">{{ $email->created_at->format('Y-m-d H:i:s') }}</dd>

                                <!-- Updated At -->
                                <dt class="col-sm-3 text-right">{{ ucfirst(__('laravel-crm::lang.updated')) }}</dt>
                                <dd class="col-sm-9">{{ $email->updated_at ? $email->updated_at->format('Y-m-d H:i:s') : 'N/A' }}</dd>

                            </dl>
                        </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection