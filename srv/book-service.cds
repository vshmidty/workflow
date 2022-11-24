using my.bookshop as my from '../db/data-model';

@path: '/book'
service BookService {
    @readonly entity Books as projection on my.Books;
}