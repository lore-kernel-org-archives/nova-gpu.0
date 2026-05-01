Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7408923D7DC
	for <nova-gpu@lists.linux.dev>; Fri,  1 May 2026 15:31:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777649504; cv=pass; b=JydcDYc8on1hvYicwxQAG51P8UNycGBAPKtJ4sJvnPPK9bMKzlA+YjdK0RYBRg//sgNsgPEEaNMTveEXNar8jhEX9cHe8qw9YL+qCr5F7xyglkLl5HB5+ZCLBAAoq8dn3XzAd0CrCJ4DOCKEwwKYCFjon+7uGtZIr5k00eMxnBY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777649504; c=relaxed/simple;
	bh=LQm9FlebjcspKv6fTqA1mawXQMaJDUpiIXw8pb4GJnQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Nu08IrM527gsgKeE78m+3AspTbnLqd7POC/7ySV3zX7hti0pejRqbWBAbSooNkp8UBeHhQWE09mpiBB/BiPmNYA+KGBue4If3SpFLYJqqnAGIdd+7I9sxYHuKUywrKy8Pp8rrcEfYF1U4sY73Ep2JcZvwP9o0Ld8NeQs35GAzxA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qUmr7k3y; arc=pass smtp.client-ip=74.125.82.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qUmr7k3y"
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-2dd52990758so228964eec.1
        for <nova-gpu@lists.linux.dev>; Fri, 01 May 2026 08:31:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777649503; cv=none;
        d=google.com; s=arc-20240605;
        b=DfFTe/t6o9PfjtakufPlqLgzwGMfPeykwfmkl6A370rrmrXyGfsMmfqyT+GJZtJGVn
         3AB2W78J+MCkIu6JwPGAS57WFqO2aKiHIiB+gK8TdRwOWb0eMJhmpEC+t5akbeT+H+oC
         MnjYbBRcbrhtDXcOEVN6gWKb8C7WG58uyf1pi63UTYs+kBNH+L30FXZjP9uv2nQxIhiQ
         p1yvw5pn+Ad2WiCYwYLG/+NaBEHYtRapSl9VeVRo2f39z12JdBbRiBrZ64FIrXDPTUU0
         PUPZWUkSJQzFVeax7kFarGQvtHY3uXkrbMRsoJa9WFaXbyPw58y9nN4eLviXYuEiHGos
         3WwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=LQm9FlebjcspKv6fTqA1mawXQMaJDUpiIXw8pb4GJnQ=;
        fh=Pga/iID80JYh7SgyO8zbm6S28BVWXuuM2JWA62XFuNk=;
        b=ca43WYx2ZM7vWa+CYg/UGEAb+hmINugvPWkb5n9xqPltghrKEf7fb6Wa0oKuI6Vkw7
         YahfZt2w1DEioMSLtkYUh+V0thrWtDOl5XuY4NxT0q2VWmD2E5K3Rr59BB41ZPO0cNCg
         NmCQnleTOGvvtd42uHQs7To5e5j4TNe2ewzXYYDBy1DupS6b4sIvAz4wFZ6nM9jgwrXb
         HuJ0Rwr2D/EEVv3xStcAvWA1rzcWK81ckFeNQlr2e+6jNLORwwkUtZBbVDQuRsW4ib61
         AGOYFOqEReq+9M75O/TuGTxNnSSMKX9qKqhyPtM8n5B482L3QrO9XnmgRRBSsxPPhhCi
         6zCw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777649503; x=1778254303; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LQm9FlebjcspKv6fTqA1mawXQMaJDUpiIXw8pb4GJnQ=;
        b=qUmr7k3yZmM1I5nAyTNoef3EnPFITMqbI+u1rYZd9iRDSGalRKOIGTXjQwB1PLLrnz
         C5w7fw5HpVizwIpaGYlBEuJFWSnaBmeUyAeUPgLh6dQl5bI3QYFRRvuVzffuIe4wqIEz
         25hi+NXu7zjx1FNxkYjueJP0v5WotdIlUya7VKi0TLlBJd4kgJ7ll0ne+AldfApLJXNy
         3b8A4o/+nHygKTLbhJT1vhnvhkUcVXJbwENa/Qdao5sbX2hHxfdNxHnn0HlGa/xkXOA2
         UI7ugYP4Zt740bPOXzBy+oCvCMs8AESYZj+EaPlOP7DGTwmMuk3kerxzyge5IRwS3AJj
         ASJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777649503; x=1778254303;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LQm9FlebjcspKv6fTqA1mawXQMaJDUpiIXw8pb4GJnQ=;
        b=L8lDrq/E354Y87B+Lh9Zo1BZwhhdVAYthKgTSOLmyK814taycov396lBVd2ATaxGhs
         S8fBLdtdHFyouO8RlGlvXF65XC6gCusftwSm8QgH4+VvgJtPdTXlhzenDQK6Z3sQ8akz
         IKJrD+6fJn4rXrYofnuO4RjYODgP9MyjCGqqan77i+YF8R1PM38/Rqis64dYgBEXlcKa
         ju/uTG0IJsJXqx2upKQxODx5T+RDfZqIdI8KAcdic0Z3gTlRc9FBAd7zApzMMcBiVqo9
         UXurIVbtEr9Ry4DZ5TA75qgKPuHAEDhBOrNqESLFCYEqGURh2Jsre4W11qQfcT0/dC8E
         fuoQ==
X-Forwarded-Encrypted: i=1; AFNElJ9kjqec8JPe6vYtTFTNeauMRWihm8lV40sQ1/YBygfjGrLO5HDyMXwNyhy2DHFqz5fEp++9kRnSMw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yyqh5Rm70ruNrmmS9yGYcRu/6HzfM9OBH0QxCuItJZs+JkW35lK
	hbLkc9AOAPOCFXXYDGDDIZlAGCPBrLyVIb+XhiPc+axbyuiDZp+Tbf97++YekbNEx4J+L9NFZaK
	luxfcuqJOoY5BLSUOtgV3d9qzkTW1D+4=
X-Gm-Gg: AeBDiethly6kzUltkvjrAPdQ7D/3xOPXl/o1/f8rBTObud7NvpnwAO8hNqPEZ7XCt8u
	Mc0DN/c9mylEMfLJUiWE1kPFkEs6MrJM+kNLPsMzhHJN1ec+E23WABERpwIuiYNv3qwtbn7VDhV
	xQ8yft2EGlP70bOPnKvW3KU2Pgm4jvEEUWedoSSVSxAi/2fWbl+kxxn8EgZigdHrPkF+TbQJpLz
	Pt3ztXpFBhHMro7jJ0sPmld+feIuNeRi2Zk5ETrG2XzS7USb2u+OQ5mjEZFoGzwzjItBtNzxp+c
	YlANxY3F4CLCgpA2trhew5C4cAvyiB8W0xAnsXpB4qwiCTxsySz3HFyyXvTl1iFrRXtz1fk47mR
	EMc5mcg8dwrn0dzFy88B7mL/WNQEU4DEFXA==
X-Received: by 2002:a05:7301:4190:b0:2d9:6373:ace6 with SMTP id
 5a478bee46e88-2ed3ea69fb9mr1648901eec.5.1777649502468; Fri, 01 May 2026
 08:31:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260430-nova-exports-v1-0-7ca31664e983@nvidia.com>
 <20260430-nova-exports-v1-2-7ca31664e983@nvidia.com> <DI7CZA3ISGOE.1CP5YEM3NNSH6@garyguo.net>
In-Reply-To: <DI7CZA3ISGOE.1CP5YEM3NNSH6@garyguo.net>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 1 May 2026 17:31:29 +0200
X-Gm-Features: AVHnY4KtSS48VYj6LcLMSfxEHj79WIZaC9QZG7nspbiebeuoKBEVWk4DqsY8Ue8
Message-ID: <CANiq72ncENCdGCjiC04Yup4i4jbY7S=k62fiT1RtQAYT=5wfzQ@mail.gmail.com>
Subject: Re: [PATCH 2/7] scripts: modpost: increase buf_printf's buffer size
To: Gary Guo <gary@garyguo.net>
Cc: Alexandre Courbot <acourbot@nvidia.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	John Hubbard <jhubbard@nvidia.com>, Alistair Popple <apopple@nvidia.com>, 
	Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, Zhi Wang <zhiw@nvidia.com>, 
	Eliot Courtney <ecourtney@nvidia.com>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	nova-gpu@lists.linux.dev, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 1, 2026 at 3:02=E2=80=AFPM Gary Guo <gary@garyguo.net> wrote:
>
> The only case that I've been hit with very long symbol names so far is do=
c tests.

Yeah, nowadays where I have seen them are doctests too, in particular
for UML debug builds.

Cheers,
Miguel
