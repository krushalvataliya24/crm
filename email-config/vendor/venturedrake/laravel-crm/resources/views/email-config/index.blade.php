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
                        <h3 class="card-title float-left m-0"> {{ ucfirst(__('laravel-crm::lang.email_configuration')) }}</h3>
                        @can('create crm labels')<span class="float-right"><a type="button" class="btn btn-primary btn-sm" href="{{ url(route('laravel-crm.email-config.create')) }}"><span class="fa fa-plus"></span>  {{ ucfirst(__('laravel-crm::lang.add')) }}</a></span>@endcan
                    </div>
                    <div class="card-body p-0">
                        <div class="tab-pane active" id="roles" role="tabpanel">
                            <div class="table-responsive">
                                <table class="table mb-0 card-table table-hover">
                                    <thead>
                                    <tr>
                                        <th scope="col">{{ ucfirst(__('laravel-crm::lang.protocol')) }}</th>
                                        <th scope="col">{{ ucfirst(__('laravel-crm::lang.host')) }}</th>
                                        <th scope="col">{{ ucfirst(__('laravel-crm::lang.ssl_tls')) }}</th>
                                        <th scope="col">{{ ucfirst(__('laravel-crm::lang.port')) }}</th>
                                        <th scope="col">{{ ucfirst(__('laravel-crm::lang.username')) }}</th>
                                        <th scope="col">{{ ucfirst(__('laravel-crm::lang.created')) }}</th>
                                        <th scope="col">{{ ucfirst(__('laravel-crm::lang.updated')) }}</th>
                                        <th scope="col"></th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    @foreach($email_config as $email)
                                        <tr class="has-link" data-url="{{ url(route('laravel-crm.email-config.show',$email)) }}">
                                            <td>{{ $email->protocol }}</td>
                                            <!-- <td>
                                        <span class="badge badge-primary" style="background-color: #{{ $email->hex }}; padding: 6px 8px;">
                                            #{{ $email->hex }}
                                        </span>
                                            </td> -->
                                            <td>{{ $email->host }}</td>
                                            <td>{{ $email->ssl_tls }}</td>
                                            <td>{{ $email->port }}</td>
                                            <td>{{ $email->username }}</td>
                                            <td>{{ $email->created_at->format($dateFormat) }}</td>
                                            <td>{{ $email->updated_at->format($dateFormat) }}</td>
                                            <td class="disable-link text-right">
                                                @can('view crm labels')
                                                    <a href="{{  route('laravel-crm.email-config.show',$email) }}" class="btn btn-outline-secondary btn-sm"><span class="fa fa-eye" aria-hidden="true"></span></a>
                                                @endcan
                                                @can('edit crm labels')
                                                    <a href="{{  route('laravel-crm.email-config.edit',$email) }}" class="btn btn-outline-secondary btn-sm"><span class="fa fa-edit" aria-hidden="true"></span></a>
                                                @endcan
                                                @can('delete crm labels')
                                                    <form action="{{ route('laravel-crm.email-config.destroy',$email) }}" method="POST" class="form-check-inline mr-0 form-delete-button">
                                                        {{ method_field('DELETE') }}
                                                        {{ csrf_field() }}
                                                        <button class="btn btn-danger btn-sm" type="submit" data-model="{{ __('laravel-crm::lang.') }}"><span class="fa fa-trash-o" aria-hidden="true"></span></button>
                                                    </form>
                                                @endcan

                                            </td>
                                        </tr>
                                    @endforeach
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                    @if($email_config instanceof \Illuminate\Pagination\LengthAwarePaginator )
                        @component('laravel-crm::components.card-footer')
                            {{ $email_config->links() }}
                        @endcomponent
                    @endif
                </div>
            </div>
        </div>
    </div>

@endsection