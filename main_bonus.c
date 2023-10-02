/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   main_bonus.c                                       :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: edos-san <edos-san@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2023/10/02 11:27:48 by edos-san          #+#    #+#             */
/*   Updated: 2023/10/02 18:14:29 by edos-san         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include <stdlib.h>
#include <unistd.h>
#include <string.h>
#include <stdio.h>


#define ATOI_BASE(s, b)     \
    i = ft_atoi_base(s, b); \
    printf("`%s`[%s] = %d\n", s, b, i);

typedef struct s_list
{
    void *data;
    struct s_list *next;
} t_list;


void printf_list(t_list *list)
{
    printf("===============================================\n");
    int i = 1;
    while (list)
    {
        printf("list_%i: %s\n", i++, (char *)list->data);
        list = list->next;
    }
}


void ft_lstclear(t_list **list)
{
    t_list *tmp;
 
    
    while (*list)
    {

        tmp = *list;
        *list = (*list)->next;
        free(tmp->data);
        free(tmp);
    }
    *list = NULL;
}

int ft_atoi_base(char const *str, char const *base);

void ft_list_push_front(t_list **begin_list, void *data);

int ft_list_size(t_list *begin_list);

int ft_list_remove_if(t_list **begin_list, void *data_ref, int (*cmp)(),
                      void (*free_fct)(void *));

int ft_list_sort(t_list **begin_list, int (*cmp)());

int test(const char *rdi, const char *rsi)
{
    // printf("test: `%s`:`%s` = %d\n", rdi, rsi, strcmp(rdi, rsi));
    return (strcmp(rdi, rsi));
}
/*
** Start !
*/
int main(void)
{
    t_list *list = NULL;
   
    ft_list_push_front(&list, strdup("toto5"));
    ft_list_push_front(&list, strdup("toto1"));
    ft_list_push_front(&list, strdup("toto2"));
    ft_list_push_front(&list, strdup("toto3"));
    // ft_list_push_front(&list, NULL);
    printf_list(list);
    printf("size: %d\n", ft_list_size(list));
    printf("ft_list_sort: %i\n", ft_list_sort(&list, strcmp));
    printf_list(list);
    printf("T: %i\n", ft_list_remove_if(&list, "toto1", strcmp, free));
    printf("T: %i\n", ft_list_remove_if(&list, "toto5", strcmp, free));
    printf("T: %i\n", ft_list_remove_if(&list, "toto2", strcmp, free));
    printf("T: %i\n", ft_list_remove_if(&list, "toto3", strcmp, free));
    printf("T: %i\n", ft_list_remove_if(&list, "toto3", strcmp, free));

    


    printf_list(list);
    printf("size: %d\n", ft_list_size(list));

    // printf_list(list);
    ft_lstclear(&list);
    return (0);

    int i = 0;
    printf("\n--ft_atoi_base\n");
    ATOI_BASE(NULL, "0123456789")
    ATOI_BASE("0", "0123456789")
    ATOI_BASE("1", "0123456789")
    ATOI_BASE("1215415478", "0123456789")
    ATOI_BASE("-0", "0123456789")
    ATOI_BASE("-1", "0123456789")
    ATOI_BASE("-42", "0123456789")
    ATOI_BASE("--42", "0123456789")
    ATOI_BASE("-+-42", "0123456789")
    ATOI_BASE("-256", "0123456789")
    ft_atoi_base("  \t\n\r\v\f -+-+-+42", "0123456789");
    ATOI_BASE("-+-+-+-42", "0123456789")
    ATOI_BASE("-1215415478", "0123456789")
    ATOI_BASE("2147483647", "0123456789")
    ATOI_BASE("2147483648", "0123456789")
    ATOI_BASE("-2147483648", "0123456789")
    ATOI_BASE("-2147483649", "0123456789")
    ATOI_BASE("2a", "0123456789abcdef")
    ATOI_BASE("ff", "0123456789abcdef")
    ATOI_BASE("poney", "poney")
    ATOI_BASE("dommage", "invalid")
    ATOI_BASE("dommage", "aussi invalide")
    ATOI_BASE("dommage", "+toujours")
    ATOI_BASE("dommage", "-stop")
    ATOI_BASE("dommage", "  \t\nca suffit")
    ATOI_BASE("    +42", "0123456789")
    ATOI_BASE("    -42", "0123456789")
    ATOI_BASE("    42", "0123456789")
    ATOI_BASE("  \t\n\r\v\f  42", "0123456789")
    ATOI_BASE("  \t\n\r\v\f  -42", "0123456789")
    ATOI_BASE("42FINIS !", "0123456789")
    ATOI_BASE("-42FINIS !", "0123456789")
    ATOI_BASE("C'est dommage42", "0123456789")
    printf("-done\n");
    // // t_list	list;
    // // t_list	list_next;
    // // t_list	list_last;
    // // list.data = strdup("toto");
    // // list.next = &list_next;
    // // list_next.data = strdup("bar");
    // // list_next.next = &list_last;
    // // list_last.data = strdup("monkaS");
    // // list_last.next = NULL;
    // // printf("\n--ft_list_size\n");
    // // printf("list content:\n");
    // // printf_list(&list);
    // // printf("%d (from first %d)\n", ft_list_size(&list), 3);
    // // printf("%d (from second %d)\n", ft_list_size(&list_next), 2);
    // // printf("%d (NULL %d)\n", ft_list_size(NULL), 0);
    // // printf("%d (from last %d)\n", ft_list_size(&list_last), 1);
    // // printf("-done\n");
    // // free(list_next.data);
    // // free(list_last.data);

    // // printf("\n--ft_list_push_front\n");
    // // t_list	*push_test = &list;
    // // ft_list_push_front(&push_test, strdup("toto"));
    // // printf("added: `%s` (next: %p)\n", push_test->data, push_test->next);
    // // printf("new list size: %d (%d)\n", ft_list_size(push_test), 4);
    // // free(list.data);
    // // free(push_test->data);
    // // free(push_test);
    // // push_test = NULL;
    // // ft_list_push_front(&push_test, strdup("barbar"));
    // // printf("added: `%s` (s%p : n%p)\n", push_test->data, push_test, push_test->next);
    // // ft_list_push_front(&push_test, NULL);
    // // printf("added: `%s` (s%p : n%p)\n", push_test->data, push_test, push_test->next);
    // // free(push_test->next);
    // // push_test->next = NULL;
    // // ft_list_push_front(&push_test, strdup("toto_r"));
    // // printf("added: `%s` (s%p : n%p)\n", push_test->data, push_test, push_test->next);
    // // ft_lstclear(&push_test);
    // // printf("-done\n");

    // // printf("\n--ft_list_remove_if\n");
    // // ft_list_push_front(&push_test, strdup("toto"));
    // // ft_list_push_front(&push_test, strdup("barbar"));
    // // ft_list_push_front(&push_test, strdup("tortor"));
    // // ft_list_push_front(&push_test, NULL);
    // // printf("before:\n");
    // // printf_list(push_test);
    // // ft_list_remove_if(&push_test, "", &strcmp, &free);
    // // printf("nothing removed:\n");
    // // printf_list(push_test);
    // // ft_list_remove_if(&push_test, "toto", &strcmp, &free);
    // // ft_list_remove_if(&push_test, "tortor", &strcmp, &free);
    // // ft_list_remove_if(&push_test, "barbar", &strcmp, &free);
    // // ft_list_remove_if(&push_test, "", &strcmp, &free);
    // // ft_list_remove_if(&push_test, NULL, &strcmp, &free);
    // // printf("after:\n");
    // // printf_list(push_test);
    // // ft_lstclear(&push_test);
    // // printf("-done\n");

    // // printf("\n--ft_list_sort\n");
    // // ft_list_push_front(&push_test, strdup("zwxy"));
    // // ft_list_push_front(&push_test, strdup("toto"));
    // // ft_list_push_front(&push_test, strdup("0123456"));
    // // ft_list_push_front(&push_test, strdup("barbar"));
    // // ft_list_push_front(&push_test, strdup("rooooom"));
    // // ft_list_push_front(&push_test, strdup("lol"));
    // // ft_list_push_front(&push_test, strdup("tortor"));
    // // ft_list_push_front(&push_test, strdup("mdr"));
    // // ft_list_push_front(&push_test, strdup("0547"));
    // // ft_list_push_front(&push_test, strdup("000"));
    // // ft_list_push_front(&push_test, strdup("zzz"));
    // // printf("before:\n");
    // // printf_list(push_test);

    // // printf("after:\n");
    // // printf_list(push_test);
    // // ft_lstclear(&push_test);
    // // printf("sort NULL:\n");
    // // ft_list_sort(NULL, &strcmp);
    // // ft_list_sort(&push_test, &strcmp);
    // // printf("-done\n");

    return (0);
}