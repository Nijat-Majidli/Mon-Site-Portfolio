<?php

namespace App\Controller;

use App\Entity\Messages;
use App\Form\MessageType;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Mailer\MailerInterface;
use Symfony\Component\Mime\Email;
use Symfony\Component\Routing\Annotation\Route;

class ContactController extends AbstractController
{
    /** 
    * @Route("/message", name="newMessage", methods={"GET", "POST"}) 
    */ 
    public function message(Request $request, EntityManagerInterface $entityManager, MailerInterface $mailer): Response 
    { 
        $message = new Messages(); 
        $form = $this->createForm(MessageType::class, $message); 
        $form->handleRequest($request); 
        
        if ($form->isSubmitted() && $form->isValid()) 
        { 
            $message->setCreatedAt(new \DateTime());
            $entityManager->persist($message); 
            $entityManager->flush(); 

            // ici, le message est envoyé à l'adresse: nijatmajidli@gmail.com
            $email = (new Email())
            ->from($form['email']->getData())
            ->to('nijatmajidli@gmail.com')
            ->subject($form['subject']->getData())
            ->text($form['content']->getData());
            $mailer->send($email);

            $this->addFlash( 
                'success', 
                'Your message has been sent successfully!' 
            );

            return $this->redirectToRoute('newMessage', [], Response::HTTP_SEE_OTHER); 
        } 
        
        return $this->renderForm('contact/contact.html.twig', ['form' => $form]); 
    }
}
