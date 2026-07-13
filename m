Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A73463D6463
	for <nova-gpu@lists.linux.dev>; Mon, 13 Jul 2026 08:57:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783933075; cv=pass; b=eNdLD2mg4jO17Y1fvd+Tnp8XsExrjFuvDv/6Th75mtFog4Nzu4C+T8wciaJRK9/xTQGfd5F41qAZGewDFOxdBmYAqQoa8qaNKbJ9GHKhZZr0oo6r2wc/glw/keJmGLK797OJJMWqBFo92/eBeXJOT8Kd/oNWDeVSwRFhHjlrj9s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783933075; c=relaxed/simple;
	bh=zGXlgemVtM/fd1QacjWZsPwmu1tJ8IeGxyTqkvyGisI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=F5brGbcAsAVLur5naLVzhOtgtpHcYgPV0vqNaKYWiddh6vwgWfIcGquGbXP36TpxPp8x7cgrZc6lHCOuNrXpK2NOuV7gwEVjbulJeOctLYRapzA4RwTmDbdf+B5vqDLHsZsr65POUKE5s298pHuc5wp9HzKpQrflmnLjXOOg/X0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=tw4qg1dt; arc=pass smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="tw4qg1dt"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-4728c12ba97so1170074f8f.0
        for <nova-gpu@lists.linux.dev>; Mon, 13 Jul 2026 01:57:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783933071; cv=none;
        d=google.com; s=arc-20260327;
        b=CN8A3ITrSJcTaevJskpd+DAHH+s4Zi4Ne/JEZVUdW6UwyWUdnKLE9TOdFrkj683vss
         nCA8y5WE6ewdTn+wll5+GNcvRPJDYT7/pp85Ix4FMHISHVtMctFaU5sDNKvzV+ZKWrt4
         0nNOu35Bo1tLscqlKcoWdc2sth39gofBLAyr54CQ1iL7pUQg6IiDqqHGbhPkzDPNcDOI
         7Krpfjkb1coB3VMS2+jHQzXlohvkzhaxBYj7gBV8f9YOqk+qN+yHLnusts2PUrabNMGv
         rL/l/WVz/L6FJeODSPtf93bYxFFU7O2aqlAfxNpAUv6Nwa5iMcWdkDRlKfl/Q0cJqIw4
         4RAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Niw6ma3uSQo4Oag5BSyj5O/UfANxhnZNo3KLkxIFV/I=;
        fh=558zdKYogPsMS35Z9Rhx3eypxxoP5CMxYSSVvXOxn7Q=;
        b=hU4RCZvhj2w/QFpikDZD6vDfAAU5tbb/bgsoomwLFXSCKSPmqzs7xGBljs7B4DmJIV
         gaB8EA1Yp4PZfIV9rHBplem6Qi3u/zyeAYDOcIE8zajZZZ7RiDmpW3A2usmLw7ZMdxGm
         ex4Ra8pXiu5JiSszt1iKt5BbpYH3vSBGp/AmmGhdu38ZP5LIXLQnipJ/xdtHb/m2Xsid
         9EJcUJsxaMuHRc/qGft5onXy6PK9NNOOzCY6Hn6T3WLkUQ/vw4QmTO3NJFCDyze5XL+3
         suVct1s5wHQdxATDqNSNTzO5UIakdZE074VJmlCWBDSqRk5nu9XfC9Scwy6ZhnwvE9n9
         DUow==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1783933071; x=1784537871; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Niw6ma3uSQo4Oag5BSyj5O/UfANxhnZNo3KLkxIFV/I=;
        b=tw4qg1dt6K86DP8dP3KqcoY7kwrq0jCrmnP98XpiNGOTOr7UFbeQLiiMiK30DPCyA1
         kgHGALyeejimRS7/3N49tFK7Vqse9YqFjSbVGNs3xRIAfo2cr/mQiEsfkXBPdTj4cBLo
         g3CszI4sSWUyWcz59XLLiAGAYw5T/jdOfpZlovdbrRbhrZCcXCoC0TRkfgBDxkvWfYeZ
         HPGznq/yhQK1zTFsUGmPbjrOchFwXWF9D/Yth/sUoNolQZXfdnD6yN+jGxMB6D3bIgnp
         BXPX5N+DAph9o2K29COBJ/uyf/18O6FdZAEpBgtbS/v4gnL3yeVzwROr2Molr9XyaK3g
         H0Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783933071; x=1784537871;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Niw6ma3uSQo4Oag5BSyj5O/UfANxhnZNo3KLkxIFV/I=;
        b=GwO5oWHZ6K2y0UBleG/rgDOYgXKJnuy90b54Cg8ZWyoo20rQoAtYCeSF5rYFuzGXRC
         DHC27HwGKJqRZ/4hDc80KG/oijDmT2D8+wtQ+fYXve1GwKra70GedSqgRnDm6X/Cs6fD
         my5FVZFLwiPuedk05GeV00Rp91fqsOY+bBHLOsYAojrxHdWkOyvbs99iC45J0kzxnaEe
         Ku7dQog1wjp9HWvStqFa3jc7+05T/ZrcY03EbEiE9SMJzY2ktItsoV1uTazT+d18EKNO
         RAI97fYGdAXArfoNqf7kjZn70/P5sw9iKI7ChHyOYlhdcLlvFQZZal1DVhazTBQPVWZN
         iemg==
X-Forwarded-Encrypted: i=1; AHgh+RquXr93y7H8WuhZjsVIxnwGBXx3qf9IqdWzAZ7PzSlLUrhWwyLKG1G8BN1ggUGhQvTu4Cw1u3j6Cg==@lists.linux.dev
X-Gm-Message-State: AOJu0YwEmt5WU8u1VqclZkGWRMJruaq/wU+Cgr7TgLU+Rkodyn9WNzaP
	CWEY2UlnmPgW/LdCqkTNMC5K81fmceZTeuHLoB6jJlOqhnqlHzxd+QDX9l7pdyZVNq2G8uX4r/t
	Cyv09RKAF7OhxuvgNLxu/Mr9ikpDHWwefRlTUaUYR
X-Gm-Gg: AfdE7cnPQ7Sk93Gfje/po3iCuPNa0zFCYXOpSNOtLjrXUZ/J/ayUqurlS/GIO1MLm7S
	yqa/dxf38TM9+ZHnBNPQmT92MPMlh0hkBzv3TAR7N8pWi6wFe/QXBh6EmdMSe1PTTlQ7T+uUxXC
	ltNHdQ8wp3FwyUttiD1KV4rSC93Qqvw/lCQgPi5BEFNPyZUx0cvdfJPQLK3hQiDQCX6eQINKQIt
	6syhCMu2giuSbpcJF6SWEzm6OnXROI9R/057Fdib4nDLkZ86zQnVdlCcTEJ4JtP4YPzMB2Z8zED
	ucDQot7sh2GGv3e4+/11Oe1hJ4Z+/ZKHG9mfH7hsrjg5F78L2gJP7n7HdC0VWRixVDwPUg==
X-Received: by 2002:a5d:5850:0:b0:472:55a:ef9b with SMTP id
 ffacd0b85a97d-47f2dcac418mr8602513f8f.8.1783933070140; Mon, 13 Jul 2026
 01:57:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260713-fix-fops-owner-v8-0-2495cfa82d47@linux.dev>
 <20260713-fix-fops-owner-v8-10-2495cfa82d47@linux.dev> <alSe6PsvdrSYP_Z0@google.com>
 <d7c1607f-ea74-442a-9700-7fc4f0c64b76@linux.dev>
In-Reply-To: <d7c1607f-ea74-442a-9700-7fc4f0c64b76@linux.dev>
From: Alice Ryhl <aliceryhl@google.com>
Date: Mon, 13 Jul 2026 10:57:37 +0200
X-Gm-Features: AUfX_mw1uUYgV4eMXkVflbUYoDKpPh-OOQHMx0yAVcG6yUMQsdEhmzk4SLg_fQ0
Message-ID: <CAH5fLggszOnUm7Rykt41V91de8h9YVaZt49wr52i3t5-QV84Xg@mail.gmail.com>
Subject: Re: [PATCH v8 10/10] rust: module: update MAINTAINERS to cover module.rs
To: Alvin Sun <alvin.sun@linux.dev>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Luis Chamberlain <mcgrof@kernel.org>, Petr Pavlu <petr.pavlu@suse.com>, 
	Daniel Gomez <da.gomez@kernel.org>, Sami Tolvanen <samitolvanen@google.com>, 
	Aaron Tomlin <atomlin@atomlin.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Arnd Bergmann <arnd@arndb.de>, 
	Brendan Higgins <brendan.higgins@linux.dev>, David Gow <david@davidgow.net>, 
	Rae Moar <raemoar63@gmail.com>, Breno Leitao <leitao@debian.org>, Jens Axboe <axboe@kernel.dk>, 
	Dave Ertman <david.m.ertman@intel.com>, Leon Romanovsky <leon@kernel.org>, 
	Igor Korotin <igor.korotin@linux.dev>, FUJITA Tomonori <fujita.tomonori@gmail.com>, 
	Bjorn Helgaas <bhelgaas@google.com>, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	=?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>, 
	Todd Kjos <tkjos@android.com>, Christian Brauner <brauner@kernel.org>, 
	Carlos Llamas <cmllamas@google.com>, rust-for-linux@vger.kernel.org, 
	linux-modules@vger.kernel.org, driver-core@lists.linux.dev, 
	dri-devel@lists.freedesktop.org, nova-gpu@lists.linux.dev, 
	linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
	linux-block@vger.kernel.org, linux-kernel@vger.kernel.org, 
	netdev@vger.kernel.org, linux-pci@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 13, 2026 at 10:48=E2=80=AFAM Alvin Sun <alvin.sun@linux.dev> wr=
ote:
>
>
> On 7/13/26 16:16, Alice Ryhl wrote:
> > On Mon, Jul 13, 2026 at 02:45:31PM +0800, Alvin Sun wrote:
> >> Module types now live in `rust/kernel/module.rs` alongside
> >> `rust/kernel/module_param.rs`. Update the MODULE SUPPORT file pattern
> >> from `rust/kernel/module_param.rs` to `rust/kernel/module*.rs` so both
> >> files are covered.
> >>
> >> Cc: Petr Pavlu <petr.pavlu@suse.com>
> >> Assisted-by: opencode:glm-5.2
> >> Link: https://lore.kernel.org/rust-for-linux/8ea21b29-9baf-4926-a16f-7=
d21c5a1a1b8@suse.com
> >> Signed-off-by: Alvin Sun <alvin.sun@linux.dev>
> >> ---
> >>   MAINTAINERS | 2 +-
> >>   1 file changed, 1 insertion(+), 1 deletion(-)
> >>
> >> diff --git a/MAINTAINERS b/MAINTAINERS
> >> index e035a3be797c4..74733de3e41ee 100644
> >> --- a/MAINTAINERS
> >> +++ b/MAINTAINERS
> >> @@ -17984,7 +17984,7 @@ F:   include/linux/module*.h
> >>   F: kernel/module/
> >>   F: lib/test_kmod.c
> >>   F: lib/tests/module/
> >> -F:  rust/kernel/module_param.rs
> >> +F:  rust/kernel/module*.rs
> >>   F: rust/macros/module.rs
> >>   F: scripts/module*
> >>   F: tools/testing/selftests/kmod/
> > Is there a reason why this is a separate commit from the commit that
> > introduces rust/kernel/module.rs file?
>
> Gary asked the same on v6; `git log` shows MAINTAINERS changes are
> conventionally
> standalone commits with a `MAINTAINERS: ` prefix, so I kept it separate.
> Gary agreed [1].
>
> [1]:
> https://lore.kernel.org/rust-for-linux/DJJ26195JBS9.D3DNLZPRJYO4@garyguo.=
net/

Ok, that's fine then.

Alice
