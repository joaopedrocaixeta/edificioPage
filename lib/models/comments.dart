class Comments{
  final String userName, userImg, comment, timeAgo;
  final int likeCount, commentCount;
  Comments({
    this.userName,
    this.userImg,
    this.comment,
    this.likeCount,
    this.commentCount,
    this.timeAgo,
  });
}

List<Comments> comments = [
  Comments(
    userName: "Júlia Fernandes",
    userImg: "https://randomuser.me/api/portraits/women/55.jpg",
    comment: "Eu lembro da minha mãe falar desse lugar, sempre que meu avó chegava de suas viagens ela ficava esperando por ele sentada na praça. Sempre ele chegava com presentes para ela.",
    timeAgo: "3 dias atrás",
    likeCount: 5,
    commentCount: 1,
  ),
  Comments(
    userName: "Pedro da Fonseca",
    userImg: "https://randomuser.me/api/portraits/men/21.jpg",
    comment: "Durante minha infância eu vendia roscas e bolos com minha mãe na porta da estação. Ela ficou conhecida como a Dona Neide do bolo. Como muitas pessoas chegavam de viagem com fome até que vendiámos bem, com esse trabalho minha mãe sustetou nossa família",
    timeAgo: "6 dias atrás",
    likeCount: 17,
    commentCount: 3,
  ),
  Comments(
    userName: "Maria de Lourdes",
    userImg: "https://pbs.twimg.com/profile_images/2456736322/image_400x400.jpg",
    comment: "Quando era jovem fui cobradora nas cabines de comprar ticket. Adora o meu serviço, por causa dele conheci meu marido em 1971. De vez em quanto ainda vou à atual biblioteca para me lembrar desses tempos passados.",
    timeAgo: "1 semana atrás",
    likeCount: 16,
    commentCount: 12,
  ),
  Comments(
    userName: "José Maria",
    userImg: "https://randomuser.me/api/portraits/men/23.jpg",
    comment: "Eu costumava ir nessa estação todo dia quando era criança! Nunca vou me esquecer do seu João que vendia doces na praça em frente a estação. \n\n Gostava de ir à estação só para olhar as pessoas passando, os ônibus chegando e a vida acontecendo. Eram bons tempos",
    timeAgo: "1 semana atrás",
    likeCount: 12,
    commentCount: 3,
  ),
  Comments(
    userName: "Mariana Melo",
    userImg: "https://randomuser.me/api/portraits/women/55.jpg",
    comment: "Que legal, não sabia que a atual biblioteca já havia sido uma estação rodoviária!",
    timeAgo: "2 semanas atrás",
    likeCount: 8,
    commentCount: 1,
  ),
  Comments(
    userName: "Afonso Bernardes",
    userImg: "https://pbs.twimg.com/profile_images/918270974029697024/lNFaPqEz_400x400.jpg",
    comment: "Vendia algodão doce para criançada em frente à estação.",
    timeAgo: "2 semanas atrás",
    likeCount: 20,
    commentCount: 12,
  ),
  Comments(
    userName: "Simone dos Anjos",
    userImg: "https://randomuser.me/api/portraits/women/89.jpg",
    comment: "Adorei conhecer a história desse lugar!",
    timeAgo: "1 mês atrás",
    likeCount: 3,
    commentCount: 1,
  ),
];