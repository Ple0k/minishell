/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   cy_strlcat.c                                       :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: cydubois <cydubois@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2025/06/02 12:51:20 by cydubois          #+#    #+#             */
/*   Updated: 2025/06/02 12:51:20 by cydubois         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "../prser.h"

size_t	cy_strlcat(char *dst, const char *src, size_t siz)
{
	size_t	i;
	size_t	tld;
	size_t	ldst;
	size_t	lsrc;

	ldst = cy_strlen(dst);
	lsrc = cy_strlen2(src);
	if (siz == 0)
		return (lsrc);
	i = 0;
	tld = ldst;
	while (src[i] && tld < (siz - 1))
	{
		dst[tld] = src[i];
		i = i + 1;
		tld = tld + 1;
	}
	if (i < siz)
		dst[tld] = 0;
	if (siz <= ldst)
		return (lsrc + siz);
	return (lsrc + ldst);
}
