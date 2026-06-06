<?php

namespace Tests;

use Illuminate\Foundation\Testing\TestCase as BaseTestCase;

abstract class TestCase extends BaseTestCase
{
    //Désactiver Vite dans les tests (recommandée)
    // Laravel fournit un helper exactement pour ça. Il suffit d'appeler la méthode withoutVite() dans la méthode setUp() de votre classe de test.

     protected function setUp(): void
    {
        parent::setUp();
        $this->withoutVite();   // ← ajouter cette ligne
    }
}
