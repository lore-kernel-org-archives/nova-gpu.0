Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49F4F18A6DB
	for <nova-gpu@lists.linux.dev>; Fri, 28 Aug 2026 06:27:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787898463; cv=pass; b=jFHeSMfVWAip8AvzUyU9FKm2ZCSbi8DOO+wGui8t4/EE/GwDLRJPFJZPVmm51pUY/c6Whg3cTU7XLzqqzIeT1M5O9hoYY5n1uUmJDo309b1Sh+1UU4QUP3WWvwCd2SGFbr0VYf0a5JF2jPgSwKJQvYUidoqhy7d0vKX6Kh87Pl0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787898463; c=relaxed/simple;
	bh=sqoZ94TDKxhKMtEaQYtpm/PK1e8YOo1KiBgbrVI0YPE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uLB8jRIGkA9chXtNVG6ViOa5MyTby/tUkmKgXnQreEiAL6KegywYNcJ8EGlqFtez5p+cJY9KpTWVLjyo9V7HO8BD46+2mNbUby323J3zITJLKag5X7r5FywSvVFreO0KrRUuEomwBVjYAXK6kRykIoCaeJpXoIX9wW7urz/MVd8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sKu0xpjo; arc=pass smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sKu0xpjo"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2d01548ac96so461015ad.3
        for <nova-gpu@lists.linux.dev>; Thu, 27 Aug 2026 23:27:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787898461; cv=none;
        d=google.com; s=arc-20260327;
        b=WWaHZogRbEEGSOjP7thGI5oBPP/cF68Y1R3ak+AA9jDY9BRh9x0orokVSed++jOjo5
         tjlXVMppxJcfHijuD3gTLcbXGKQeDnHHwuND/T4KAVRUWUx5YkwxKWhY4IATrMXpEFrs
         bFRckKzYlNmDIhmhQlk2M9w0cNVvUW97VqMUIwO17B/buGqW9i0hYA8a0sn03bNhzbwX
         HdyBS4HcVzp4QOeK/PuSIRVlbYo3I8aSNiDo6iYiCPGWXT6yxtlpKa+SM4XTTcSKESjN
         l7r5qB7joBwgozpIhFU/Ccu/VMhwCzm7L295COHuwZ1j9KPj34+moWON9FqnwssM6BbZ
         cqLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0FpSUPDMQtu2ZqaSK17CZnsys4mRnbF+hvV6Nhgnp7c=;
        fh=9C/tKlLkVwSqC4NssSE0+OoY+Vb8ciK7+Sz0DN/RzoE=;
        b=goFFfRhyy1Q00auhwvVaP9tLw1jBbE7idGI98vjzT0V7OjIP5zbroB7FwysFPeQjRd
         fwpU04Fu+f0CYtWe82JZzWDG+GBeC7mNelPVcxBvKW6Ym68H3ldcAE+39rwKpDbzKSLK
         S41Piz7i2jNyQjdJtRIFZI7kRqrhVCP4GyOKydOcwVBMBZUgoOXdBUURuKxJmQEWqxtI
         Hof3fuZH4UuRZ+BLQ4RCj8+MwkuZ+hAxMukcm9hp2BinitsV5VHgAav6yk0vFd0U+l+/
         h6DX5lZnaxye+H3Nvie+GRwWZIa4ocgEyfosHhvIkO5noRW68GuYmFxjrqGtIQWKq1TZ
         x8wQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787898461; x=1788503261; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0FpSUPDMQtu2ZqaSK17CZnsys4mRnbF+hvV6Nhgnp7c=;
        b=sKu0xpjo+u4PSkKMxEzawAbicEz2UKJPKV/Sg373o7lcnniLJmHzVh/lA1N9LbfmBM
         FhuDiCu/0VdnI1MMHvGGqIXt9LL5x1ugafcWleyjs0hUYCYjPKGbM329CGby6MzNLSgE
         QATrw2wEUMOGgO7jw6ZO5sHDd1EfUt//xTcUXgP+vEgIZZL8nzAez3U9ppuwmPCphW+M
         WUaXjgvrQ76OTzL9NMC8PgaRHDwtTIsuiPo9NLCW+79eRZNJy9ESv4pLua7aiLZNSgK8
         fLmb6Zk4JA4qKRRhGFvSsg5/P4/JS5lZJoa62z99h6uq6EACiFhzcf1h+hJn2DCBwJ2A
         cgoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787898461; x=1788503261;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0FpSUPDMQtu2ZqaSK17CZnsys4mRnbF+hvV6Nhgnp7c=;
        b=GvfDM9/6GK/JNkrNtatmuuoWfflvkLVLYN/hM0jnuBfBDMnpx7ulM+pF0BC8gfCzwk
         ULqd1ezXpt/6bhANK1Y9HMgHO1RyxPJJkfbH8HVXV9Pk+oGBT/f3hzKVEGbpCpYJWxk+
         9DeTzUDzJl6kvfOHBypxuJe0VBv3pucZx8Dlb/wR4NgjI2M1qsEx3qgqqnkBhTmMj50m
         a/opLWSfIhfxP5yU3t/9f6Ni3PDcwzCdyL0PLidDQP8D8+b6K7LDRVQzSM4H3M5k9f/X
         v9eEmvAkoi1TWZhSDylzbYa7we3ONGSVeKy8gx9iMocZ4rBOKfhh+9Nb4nyg9dVkKUu5
         Y5/g==
X-Forwarded-Encrypted: i=1; AHgh+Rrew5kTLsLoRg/+BHlUHh8OLZdqHmoKne6Qq8VAeeSTYPBv2bP51WWlUK2FB+pEoIXMTRSxJmHYcg==@lists.linux.dev
X-Gm-Message-State: AFuF++mC218/3v/+GTJRfLTwS8WslS0RDOOcoZ7Q4DdnKRy+R5F8xCaU
	L8SuRcCF9OCXryVJl+OAEqLJaq5rExZVnsQOwyIo9wG63HBqULvtvVQOufUq+7yEc9ipRX0lKbs
	nU7m3CW61+x56ivUM4G9szUf+DUNKEJQ=
X-Gm-Gg: AR+sD13ppJ4Oeh3/wGrJx6zq0NQsA60O+NlVE9kE28TQCdfKKdgp/2ue2EIJlMrhz5x
	02NSdFubinrqR+HSpbRLWmFYiSWfPQWCM435CqhrnR+FUc43hhmtEb4Zr6nfL/Rx9TLXwZYIKWy
	RoJab2k2DP/tgS+INzFXwhqENTunzdpS3xuOvZbiaDphRogbo4XQF7mM444EAVhPPA5zHGYt2ll
	e/Bol1VX7Dwtt/WFL2GkF3UrvcqLxNaVp1xK37FvHQMvNUI0AxUch3n/jhZ52iIYxFl9b0JWfa3
	kmtW2B1mxXCkbT01OFwlzr3X64C3czMUvpqiqw45T4pG/mXsMnqagQVucMaIWqk471bixPjLPkU
	hXVeHSiDVG+fBi6LWHiDued3cmimAcUjrB+aa8MYfpeh3i7PQBXBQ3CtClTaCuy6R30QZWOk=
X-Received: by 2002:a17:902:e742:b0:2d7:d12:552f with SMTP id
 d9443c01a7336-2d74ce2e25dmr42511675ad.0.1787898461636; Thu, 27 Aug 2026
 23:27:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260827-chid-v8-0-bc74c77d0214@nvidia.com> <20260827-chid-v8-7-bc74c77d0214@nvidia.com>
 <DL0BIY2CGYQ3.TY18JERIWOUK@nvidia.com> <DL0BR314U4Q3.PMFAV27Q6EM8@nvidia.com> <DL0C0HAK8CKB.PES9IOYFNA9D@nvidia.com>
In-Reply-To: <DL0C0HAK8CKB.PES9IOYFNA9D@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 28 Aug 2026 08:27:28 +0200
X-Gm-Features: AcwNN1XEykTRjxOk-JWsfu04X-RzlIeD5qnkPfp1CbxkCq_OEMkQfZ4p6INdjp4
Message-ID: <CANiq72nunnWs7+-fwJTvqYQn5J-0bbNq_O4LBkua5GymX1vN0g@mail.gmail.com>
Subject: Re: [PATCH v8 07/12] rust: sizes: implement SizeConstants for Alignment
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Eliot Courtney <ecourtney@nvidia.com>, Alice Ryhl <aliceryhl@google.com>, 
	Burak Emir <burak.emir@gmail.com>, Yury Norov <yury.norov@gmail.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, John Hubbard <jhubbard@nvidia.com>, 
	Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, Zhi Wang <zhiw@nvidia.com>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	nova-gpu@lists.linux.dev, dri-devel@lists.freedesktop.org, 
	dri-devel <dri-devel-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 28, 2026 at 7:36=E2=80=AFAM Alexandre Courbot <acourbot@nvidia.=
com> wrote:
>
> The custom is generally to have `Link:` follow tags like `Suggested-by`
> or `Fixes`, but I guess it is also ok to keep them as general context
> when nothing matches.

Yeah, normally one provides a Link tag after e.g. Suggested-by or
Reported-by, but the Link tag is more general, i.e. it is meant to
provide context in general.

What I suggest is using a reference like [1] from somewhere in the
text to the link, so that it is clear what is the context being added
for:

  Link: https://... [1]

But sometimes that doesn't make too much sense, and so it is fine to
have the Link: tag on its own too.

By the way, the commit message also has a "code span" in a new line --
I would suggest indenting it and removing the backticks:

    Alignment::new::<8>()

Cheers,
Miguel
