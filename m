Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20B132DFF3F
	for <nova-gpu@lists.linux.dev>; Mon, 25 May 2026 18:02:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779732153; cv=pass; b=HfClIQqaonqymk6lkUhA6y2F9lVOiolVoJbTM8yL3qmbO27Bhi8x6yk1gjK2EkxuEJu41ALCD09fIJq4jv/+9IbXcwtYjYYbLLJ2SFBbuIilVZimFTidx5PoDyhZm/J8ZAHkL/VN5GAmIqLAhr6in1WfuLwDvDScPGJpx9y41GM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779732153; c=relaxed/simple;
	bh=8ZSUnXluYLVn4jYwuGuuAoUqSSDCn0ar/92Y3HH//e0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rNxttBL/nFwlctHnMoFXVcf9gu1KJ60rgi92AOxjSJ+S8h23wcRmgHki9ch22HamPbDs3Dz96vwvTp9516Li2fr3xAYw0MVRriBQs6BMVkwNU31dew0yb3zY2kkVeK1DdNQ5TpoPVi3Vj97oG/Gv/kdLjdzDu3FU70Zx87qw5mw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lUXQv4ib; arc=pass smtp.client-ip=74.125.82.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lUXQv4ib"
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-2f5ae07e2b5so797543eec.2
        for <nova-gpu@lists.linux.dev>; Mon, 25 May 2026 11:02:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779732151; cv=none;
        d=google.com; s=arc-20240605;
        b=HnEuf0tVC6hhW1RO+YMY+n18f3Y7ihMKLP7OAFGR08gPnwJg0mYBV8UQZ2GB2tnrge
         bmFVhHCFtHV2EUrbvzwO3plVDWsMBuIdzDOxtT/vaPyJWRVKq+RJk27yonX+UD18jMGI
         f+I0NNyMmYFEZEvp3ml0D0VBHVGm35lyFMGQkU9wDGxl4QABu6MQLYFq1A0gtZnfy7oA
         LkcLryMplDqEnfNNk8S1PTL8g8XO8GH+m8XATxjvwIXhDhmU5uBWvEc6KRkhYKJAwIrB
         6Tjaylobbj8gG0K8aFX3sP9oo9WAv2RivH9oYI8lXnF9lxdKsnIBYVP4oxstWsidIHJT
         fEfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=8ZSUnXluYLVn4jYwuGuuAoUqSSDCn0ar/92Y3HH//e0=;
        fh=IWY7tKkmHLDTy4Gs82aQiZRGC+5DKtJcqu9o+Hrz6rc=;
        b=TvJzogUjxbS11g6JEOVDp5Bm/JvjvFqPfUtQ7p0DCCfEBoSTXN31lOKuVGFCwo4NZh
         JzkYGv9QHDuSOSLUmFPCGIRlKSsAWnH4g2la6hga+OZ0HWPjQszAHnb+YUnwViNjBrgB
         yBw+YqhSqhojs0SF0kGfsE4UbVx35oAwtgkFypq8NYtWlmi/B6CALxyOsJdmsRCMXoHJ
         Er9AjdBu1RmbEooxYygE4ISB30e2QJd+NKoLuJtcmIzMH7445lXJRRLVi7A4D67TlQC3
         zwVll1xrq12EBXdraz8hdwruFvNn2MICqOKvr9Ik9bZWI0mRVi/Do8fREiC4XvB+LDwl
         1XAQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779732151; x=1780336951; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8ZSUnXluYLVn4jYwuGuuAoUqSSDCn0ar/92Y3HH//e0=;
        b=lUXQv4ibF4Ct+ZTMoIqpBmjgAz6BRJP1TEA8tgEjN4k0WEJpFaf+4SMCKtUI7WYwef
         yXSamv4ZnBCmLYPTWDjNWmOVV54hHa9xCi6U7rixgxdbcxwew3NIG9DiAnYSOs1Dk80T
         WxGtquCRj88LPgknwhxUbUDINaUJUQAPJq80fdO/8Uor4qx0knn4yGVgDk5O0VZBorA4
         o54+E9nH6Uz6TupUGJhkMNvsuMcSK+C33XdTn/m6lSQ6T7yOk117liTWNA9kvNmm6zoU
         LSDVxywAAI6xTudDCIc8YvDV5HP1LXA66FxiAEJ7pzrNGekKO54tOgpoFCiT65LAZNMj
         H5wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779732151; x=1780336951;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8ZSUnXluYLVn4jYwuGuuAoUqSSDCn0ar/92Y3HH//e0=;
        b=HyJxrAANx55daW0kX2yV4vQl2Vi5SfL+KqsXwChXzYbgZ2IAX2RA+bbl3Sx+t4HF9h
         fHg2ErBjeSvpe1o83suyX/volYXfXkzdV9pmLwYBtYOSwv8O2RAdl1KmyFHgpAT6qOtZ
         8Z/1s9bydSXfozVHX0slcMy0IbpVivncwZIuT5k/+zGu33gzEs0keE1YIHs98Q+MCYVl
         IsLSzznBkEtW36+Wqxj5TnYQ2loTOpCFS8bAYK5Ib9XTfQPZBTD5F6VhgIpiTEA+rYXl
         Tsss8r7Jknu/IbG+Rm/oARYg2dUgBiTUbKDDGMq9QBwYD9ag9WTs3nlfIcTQNs5EJBEq
         eMQQ==
X-Forwarded-Encrypted: i=1; AFNElJ9x+4BzU9JtY7O23crRg6LJZfqfNx/saLLNQyqRnjC2TXu7oDSLjwF6d6fLxOqHaXLioB4rAA8CRA==@lists.linux.dev
X-Gm-Message-State: AOJu0YwYcNkvqOkYrnOQq8G1gloTcoF+LrAt20EtATs6OwXvLGLKI3+/
	MVSqKVwwPgM/J1I40kEBY1S39Oz1wiabFb3q6+Birf7Wrq1m+MZ79TgC8ANjTg2U/STlMF318wn
	FnY24XawDD/ND6iwotM8BOl+KimzKixE=
X-Gm-Gg: Acq92OGuzHNx89mii635IfchYHf61bVCjcce+dpOCfXu4Vr9GZ65vtLaqJM79kwqOuP
	ztr6BoW1e+JYp1CXxdagb98O9vmE9giETaCKt+3Vi/3RD/b2IOBGCSdGCxS8BXQOQJRgG39Gc2t
	h+vC3zXnabBw+pokg8rlYb9a5aNCDF2gHM5E53DlX2wopviOmRpNIhy7lD01FXe4oSsycTsKPsk
	l54kzDwxqnnHCoUhvONsa8TrxFkF5oFuuUY/ji6JIq/BZE9kUHatFM8QVZowZR7SE2ZY9OOnroK
	rj9HvTW/H2d+JuxPOuuybEt7vrrzk6lUdxsQ9OivPZXd4vo9fPFRoQJBKSJ8+jLpmnuE9aE5VhM
	vSWCcjTpsXNoWGoyvXXI+vmM=
X-Received: by 2002:a05:7300:fd10:b0:304:1fb6:8903 with SMTP id
 5a478bee46e88-3044911cc33mr3366059eec.7.1779732151161; Mon, 25 May 2026
 11:02:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260525-fix-vbios-v5-0-e5e455251537@nvidia.com>
 <20260525-fix-vbios-v5-15-e5e455251537@nvidia.com> <DIRU7Z3NH9J2.2HT7Z93HFCFW0@kernel.org>
In-Reply-To: <DIRU7Z3NH9J2.2HT7Z93HFCFW0@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 25 May 2026 20:02:18 +0200
X-Gm-Features: AVHnY4KrDhM9kXsLM911_pGuZ_nGXHEjBgcjbdN5ENiTRugzSuQvUMPiVBLF30A
Message-ID: <CANiq72kR0raSG33DgSxMuc-2uMa626dT=-5=ko_HBgmeOrCFZA@mail.gmail.com>
Subject: Re: [PATCH v5 15/22] gpu: nova-core: vbios: use the first PCI-AT image
To: Danilo Krummrich <dakr@kernel.org>
Cc: Eliot Courtney <ecourtney@nvidia.com>, Alice Ryhl <aliceryhl@google.com>, 
	Alexandre Courbot <acourbot@nvidia.com>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	John Hubbard <jhubbard@nvidia.com>, Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
	nova-gpu@lists.linux.dev, rust-for-linux@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 25, 2026 at 4:46=E2=80=AFPM Danilo Krummrich <dakr@kernel.org> =
wrote:
>
> However, I'm not exactly sure it really is an improvement in terms of
> readability and whether this is a prime example for this lint.

The lint is globally allowed since v7.1-rc3, commit 838d852da850
("rust: allow `clippy::collapsible_match` globally"), so please feel
free to ignore it.

(Same for `clippy::collapsible_if`.)

Cheers,
Miguel
