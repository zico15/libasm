/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   main.c                                             :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: edos-san <edos-san@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2023/10/02 10:34:27 by edos-san          #+#    #+#             */
/*   Updated: 2023/10/02 13:10:55 by edos-san         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include <stdlib.h>
#include <unistd.h>
#include <string.h>
#include <stdio.h>
#include <fcntl.h>

size_t ft_strlen(char const *str);

int ft_strcmp(char const *s1, char const *s2);

char *ft_strcpy(char *dst, char const *src);

ssize_t ft_write(int fd, void const *buf, size_t nbyte);

ssize_t ft_read(int fd, void *buf, size_t nbyte);

char *ft_strdup(char const *s1);

void test_strlen(char const *str)
{
    printf("===============================================\n");
    printf("ft_strlen: %li\nstrlen: %li\n", ft_strlen(str), strlen(str));
}


void test_strcmp(char const *s1, char const *s2)
{
    printf("===============================================\n");
    printf("ft_strcmp: %i\nstrcmp: %i\n", ft_strcmp(s1, s2), strcmp(s1, s2));
}

void test_strcpy(char const *src)
{
    //ft_strcpy
    char *dst = calloc(ft_strlen(src) + 1, 1);
    char *tmp1 = ft_strcpy(dst, src);
    //strcpy
    dst = calloc(ft_strlen(src) + 1, 1);
    char *tmp2 = strcpy(dst, src);
    printf("===============================================\n");
    printf("ft_strcpy: %s\nstrcpy: %s\n", tmp1, tmp2);
    free(tmp1);
    free(tmp2);
}

void test_write(int fd, char const *s1)
{
    printf("===============================================\n");
    ft_write(fd, "ft_write: ", 10);
    printf("len: %li\n", ft_write(fd, s1, ft_strlen(s1)));
    write(fd, "write: ", 8);
    printf("len: %li\n", write(fd, s1, ft_strlen(s1)));
}   

void test_read(int fd)
{
    char buffer[5000]; 
    buffer[ft_read(fd, buffer, sizeof(buffer) - 1)] = 0;

    printf("===============================================\n");
    printf("ft_read: %s\n",  buffer);
    buffer[read(fd, buffer, sizeof(buffer) - 1)] = 0;
    printf("read: %s\n",  buffer);
}

void test_strdup(char const *s1)
{
    printf("===============================================\n");
    char *tmp = ft_strdup(s1);
    printf("ft_strdup: %s\n",tmp);
    free(tmp);
    tmp = ft_strdup(s1);
    printf("strdup: %s\n",tmp);
    free(tmp);
}



/*
** Start !
*/
int main(void)
{
    
    char *s1 = "Hello word!\n";
    char *s2 = "Hello word!\n";
    int fd = open("file.text", O_RDONLY);

    printf("fd: %i\n", fd);
    test_strlen(s1);
    test_strcmp(s1, s2);
    test_strcpy(s1);
    test_write(1, s1);
    test_read(fd);
    test_strdup(s1);

    if (fd > 2)
     close(fd);
    return (0);
}
