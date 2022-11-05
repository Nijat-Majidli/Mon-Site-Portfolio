<?php

namespace App\Form;

use App\Entity\Messages;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\Extension\Core\Type\EmailType;
use Symfony\Component\Form\Extension\Core\Type\TextareaType;
use Symfony\Component\Form\Extension\Core\Type\TextType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;
use Symfony\Component\Validator\Constraints\Length;
use Symfony\Component\Validator\Constraints\NotBlank;
use Symfony\Component\Validator\Constraints\Regex;

class MessageType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options): void
    {
        $builder
            ->add('name', TextType::class, [ 
                'attr' => ['placeholder' => 'Name'], 
                'required' => true, 
                'constraints' => [ 
                    new NotBlank([ 
                        'message' => 'Please enter your name' 
                    ]), 
                    new Length([ 
                        'min' => 2, 
                        'minMessage' => 'The name must contain at least two characters',  
                        'max' => 255, 
                    ]), 
                    new Regex(['pattern' => '/^[A-Za-zéèàçâêûîôäëüïö\_\-\s]+$/', 
                                'message' => 'Please enter valid name' 
                    ]) 
                ] 
            ])

            ->add('email', EmailType::class, [
                'attr' => ['placeholder' => 'E-mail'],
                'required' => true,
                'constraints' => [
                    new NotBlank([
                        'message' => 'Please enter your email address'
                    ]),
                    new Regex(['pattern' => '/^[a-zA-Z0-9._-]{2,}@[a-zA-Z0-9._-]{3,}\.[a-zA-Z]{2,4}$/', 
                                'message' => 'Email address not valid'
                    ])
                ]
            ])
            
            ->add('content', TextareaType::class, [ 
                'attr' => ['placeholder' => 'Your message', 'rows' => '6'],
                'required' => true, 
                'constraints' => [ 
                    new NotBlank([ 
                        'message' => 'Please enter your message' 
                    ])
                ]
            ])

            // ->add('createdAt')
        ;
    }
    

    public function configureOptions(OptionsResolver $resolver): void
    {
        $resolver->setDefaults([
            'data_class' => Messages::class,
        ]);
    }
}
