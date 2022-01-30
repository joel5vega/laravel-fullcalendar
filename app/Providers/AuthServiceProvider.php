<?php

namespace App\Providers;

use Illuminate\Foundation\Support\Providers\AuthServiceProvider as ServiceProvider;
use Illuminate\Support\Facades\Gate;


use Laravel\Passport\Passport;

class AuthServiceProvider extends ServiceProvider
{
    /**
     * The policy mappings for the application.
     *
     * @var array
     */
    protected $policies = [
        'App\Model' => 'App\Policies\ModelPolicy',
    ];

    /**
     * Register any authentication / authorization services.
     *
     * @return void
     */
    public function boot()
    {
        $this->registerPolicies();
        Passport::routes();

        //scopes dar permisos por roles

        Passport::tokensCan([
            'estudiante' => 'Usuario no autenticado',
            'docente' => 'puede crear horarios',
            'administrativo' => 'tiene todos los permisos'
        ]);

        Passport::setDefaultScope(['estudiante']);
        ///

        Passport::tokensExpireIn(now()->addSecond(15));

        Passport::refreshTokensExpireIn(now()->addSecond(30));


        //
        // Passport::loadKeysFrom(__DIR__.'/../secrets/oauth');
    }
}
