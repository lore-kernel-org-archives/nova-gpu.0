Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52C8C3AD514
	for <nova-gpu@lists.linux.dev>; Mon,  1 Jun 2026 13:51:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780321872; cv=pass; b=gjEk9A7/K99jZ/8j+/FvEFRYJFAZeLQU3w5td+VzLcssE5Kq4HsvcTqIsgRmbBlyxaCvAH3MrlBIVVxZSwDX45uZdyAzhoNGcB91VmJVUZalgmLOQLvfo9PjWiw/WjKdzqwIyQYh+NbuXQNdF1tAuayh/IWyX63aIAaY65WkHS8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780321872; c=relaxed/simple;
	bh=r/oT687eVRP4yV0RK814W+7Ioe7FWGW2hQhsq1wvEnI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lXsh/rjq/dmlmR7JvGd2WhuXfnWS0ENo6ufSKT4Ka7igOM6b2D7Q0J+ujoX1IHSm7AUMZfdIfWefcZDB05rAGrnC+iYiSqAaMOwNUunuUW/YprYJY6A22l5qg4hbRHbpWHczRbo/b2KSnwT8tfKAD8s5+hKzJQnvaAQK+By3eac=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RaRpJt6I; arc=pass smtp.client-ip=74.125.82.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RaRpJt6I"
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-137dd3bb44eso103305c88.0
        for <nova-gpu@lists.linux.dev>; Mon, 01 Jun 2026 06:51:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780321869; cv=none;
        d=google.com; s=arc-20240605;
        b=HT56fV05/hkXz/wXLQIOX5XHldYTJcVTnhNrZrkLhY7l6QZ5Kn45CsZUWg/nF05MKO
         mTb7nb7vVACYfDIA5uOO1lZxaAjSTUpQdSe175zeKu8wMXA7rJRx8dPqLMc9bs0jiloq
         RoJCExGYgTFhJgwoCSc7dy6XcQyVW0DKMylXQZ3449gKSwDedxxu/yDIPEy9Bhqktk1+
         luhZWxH6ovMEOt10t7cBBrJ/aAfaqcc+ahPLF1QdR4j5hrfkvbSRZkeLjOz0z+t0P7YO
         WsicCCEOtTM2v5TqRpvyBdKR7F5C7C4w2oCOBfSNB8jwKCN2JRjNmybrogvVYR6APjyH
         Gvmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=r/oT687eVRP4yV0RK814W+7Ioe7FWGW2hQhsq1wvEnI=;
        fh=AVdhJvN+yY6C4BCzI5UxbDUrdtfZn0S6f8hfKea8H/E=;
        b=TskrXq+T7Xcsznc1aUsL1kaxjwKIxu3q8TWDd1Z0L6xiVVKhe88jrfKfuVwImVrHe2
         sSZoDEGF1DYlQalp7HX2GikSNnqwwoWvKUr8jOKWfHnZdSspKWhDC9rvRvaLD7t+d+kI
         AX7vTjuGkN7NIUZcagMB+vzERQeGRV2k0mR1kcWLQRKHy5yOpwqmEk3QQZnlA1dHM2eN
         iZls0vmHx4M0Zcic9mYY+tz6okECjBX0ZY7Z91Ot2N22c8jWJNjipHK7h+svycn/c0vf
         9XvKa7KiTHOGt60Pdx8t/OV6GhowX2QCih/2+bLbmB91I0hicZs7I9Mzlx9EecnbO/NZ
         j0Sw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780321869; x=1780926669; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r/oT687eVRP4yV0RK814W+7Ioe7FWGW2hQhsq1wvEnI=;
        b=RaRpJt6I8DUApBXOxKRy27GXomNsniDS6nYRwD8qO+SNtbbXuWrJysA4brMksImUbt
         FXbhzMZMse9DgF+zKWM6pRhCd7mJb/F/kWkcnH1PyF4CqMn36W78UXw2gVqbEWqCNF4V
         KdlzLFD+Su7EctLA4PNSLGROZ9MJQWVXgEN9GX8uk7/vKcwT4GgFaZdiI+ALzkE045F3
         fXyRYA45LDX/ViDPOjI9JpkvqI8biCCEl9kzDhuINXazfkx1to1dWXS0LKL8GVDYVsLT
         VcN2Jr7YLhQZVFtCCylRxkITaA7ziDLZbvnA9Y0QxroM4zDNvTiIV6fiOycb7VnAVH+F
         f/Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780321869; x=1780926669;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=r/oT687eVRP4yV0RK814W+7Ioe7FWGW2hQhsq1wvEnI=;
        b=p0zFlvY3+lC6/isoHHZwGFbCJApG35Czpo8GyKzGlDQnu8Im/F9LG8iGaM8aSdBn8P
         M1ynhYUHMV5K7ZrQtkknHtNVDpmtwiWu2nMXVFR9ZemRm35wxBr5BM66JXFfWMZlkYyG
         lZULXtV7vFLNKGrhfsjE9am9YHkCp0FfRVU6jGQpXcTa6srrm3VB+FPwYgxBAUC7QGSs
         +I8wdAekSzaXZWBxbwzXMtHE+J62UsdQmGTWQEf9Ev8wcqrLj+/o1O/ZeE8UOtsxU+KP
         FjuYJAFN4ARJBoY8GreTXdYzsKRjaVBxmWZH1GWfqc6Uw0Q/RDJbgRYeMtIm9BZ2gTr3
         TmqA==
X-Forwarded-Encrypted: i=1; AFNElJ/quHIlzCQC0AjO9zovZI3fjzanT6tjWOd3IfQXoia5M32Lx7QoRN8LvK3peNEnSNgVn/EHJPR4Og==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx91eFeOOAJCQULZDt+iMWvck0BMLbEQ1KRkbrHyeR0XZQjuLd1
	vI5EQ/apKWTFUuRo3INVesbEWyAQJOfHfagRH3y4yXVIzu84g+lMPcM4eDFGQaLfEGkRUbRmSMK
	Hk7aKd1RAeIetTYDXYzEFZgSJIxsxZLY=
X-Gm-Gg: Acq92OHpAupUJ4UfJYRXc5Dd9OmREHRmqakXYOd5Kgf+la7/qOx/bFVHa6w/0TtLjbL
	/dHxBwnNRwd/crrYBnTkJ8zd0C6u4exsmGDKSzFHR4vQ/gaG6JDIyD7q0OWxgyiCQ3CFxU1RLCK
	YeqInZ0qq2e6o3/YJqzn2XVgc20SZT4bQ4mS9/4J7RLAaLXRANP01WTPy8t7Hsi8jRmuk5qEjWj
	WI8kmAYvVRU2FeCWNxrN++Hiqni1O+KimYb0OUUjOyCOmqgtfmmcSp45EaTIt43vxX2rvH2ExYA
	zZvUP32zoq2MUKif3moFomXBSlBbgJRuEzOWFxI4nbnVBkCQJ//8HROHo9KdX7z/osGTdyMBPtC
	WJg/ZrsOhiWs7QQkTYda9dCGBQH8CXPDlmQ==
X-Received: by 2002:a05:693c:2c8c:b0:2da:b05a:5a7d with SMTP id
 5a478bee46e88-304fa31c4a2mr2349142eec.0.1780321869058; Mon, 01 Jun 2026
 06:51:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260530-nova-exports-v3-0-1202aa339ef7@nvidia.com>
In-Reply-To: <20260530-nova-exports-v3-0-1202aa339ef7@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 1 Jun 2026 15:50:56 +0200
X-Gm-Features: AVHnY4KWUDuK60JTIBwgnlL-tTjDarV9LStXY-LSeVpwOJ2FNQpjnaTpcPZMaew
Message-ID: <CANiq72kbzmLeFv58mkiKn+LvhCXmH5g7UsnTYTcVmJ6kyc+vLw@mail.gmail.com>
Subject: Re: [PATCH v3 0/5] gpu: drm: nova: enable calling into nova-core
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	John Hubbard <jhubbard@nvidia.com>, Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
	Zhi Wang <zhiw@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	nova-gpu@lists.linux.dev, dri-devel@lists.freedesktop.org, 
	Joel Fernandes <joelagnelf@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 29, 2026 at 5:28=E2=80=AFPM Alexandre Courbot <acourbot@nvidia.=
com> wrote:
>
> In the meantime, this series introduces a Nova-local workaround for
> `nova-drm` to call into `nova-core`. It generates the `nova-core`
> metadata that `nova-drm` can use to resolve references at build-time,
> and also builds a list of exported symbols for symbol resolution when
> modules are loaded.

The "local approach" is essentially what I suggested back then, so if
this works for you then I am happy -- with the understanding that we
will replace it with the global support soon (it is good to have a use
case in-tree :)

I see you play some tricks to get the ordering right, including a
sub-make with a double build of the `.rmeta` in "private", which in
turn forces you also to do the `.o`, right?

What I originally had in mind was simply to do everything from a
single parent `Makefile` instead, precisely to avoid complexity (after
all, it is the local approach, so you don't need to force yourself to
handle that). That should remove all those shenanigans, and it is way
easier to get right. Did you consider it?

By the way, I think a `.gitignore` entry for the generated header is missin=
g.

Cheers,
Miguel
