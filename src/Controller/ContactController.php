<?php

namespace App\Controller;

use App\Entity\Messages;
use App\Form\MessageType;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class ContactController extends AbstractController
{
    /** 
    * @Route("/message", name="newMessage", methods={"GET", "POST"}) 
    */ 
    public function message(Request $request, EntityManagerInterface $entityManager): Response 
    { 
        $message = new Messages(); 
        $form = $this->createForm(MessageType::class, $message); 
        $form->handleRequest($request); 
        
        if ($form->isSubmitted() && $form->isValid()) { 
            $message->setCreatedAt(new \DateTime());
            $entityManager->persist($message); 
            $entityManager->flush(); 

            // ici, le message est envoyé à l'adresse: njatmajidli@gmail.com
            // Ecrire le code ........

            $this->addFlash( 
                'success', 
                'Your message has been sent successfully!' 
            );

            return $this->redirectToRoute('contact/contact.html.twig', [], Response::HTTP_SEE_OTHER); 
        } 
        
        return $this->renderForm('contact/contact.html.twig', [ 
            'category' => $message, 
            'form' => $form, 
        ]); 
    }
}
