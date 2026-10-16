/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   cy_memset.c                                        :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: cydubois <cydubois@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2025/06/02 12:50:56 by cydubois          #+#    #+#             */
/*   Updated: 2025/06/02 12:50:56 by cydubois         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "../prser.h"

void	*cy_memset(void *s, int c, size_t n)
{
	size_t			i;
	unsigned char	*tmp;

	tmp = (unsigned char *)s;
	i = 0;
	while (i < n)
	{
		tmp[i] = c;
		i = i + 1;
	}
	return (s);
}
