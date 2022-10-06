<?php

namespace App\Controller;

use App\Repository\ProjectRepository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class ProjectsController extends AbstractController
{
    /**
     * @Route("/projects", name="app_projects")
     */
    public function index(ProjectRepository $projectRepo): Response
    {
        $allProjects = $projectRepo->findAll();

        return $this->render('projects/index.html.twig', [
            'allProjects' => $allProjects,
        ]);
    }
}
