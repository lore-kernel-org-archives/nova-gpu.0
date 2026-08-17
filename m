Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A6F147044B
	for <nova-gpu@lists.linux.dev>; Mon, 17 Aug 2026 20:12:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786997574; cv=pass; b=MghnFeaYXp77TC3c9s9l5EGb8bndRR6E1zvmR3VkgLaqcLgoTSENIqxcTb01bu/dnO7OSwUzy+SzYDua8CYhhm1UvEJC9OuKpROidAMJ4I34R6YMLMHpP4xU8qqxKKCFWlaqZi4yJjf5FUVuEHiOJq0Q2r8bngqrR48x7CwuLBE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786997574; c=relaxed/simple;
	bh=rmF0p5wb5vrcnie95iYpLQsIO/+hD7X9foCeks4E8TQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SPS9XwKgbVyUg3aAazqZq2VKnW8OOYkQsYnxnwKUEPHeaTlWrM1DTK+gKkgqNMoNs5iEQCJ4s7H5HwBhFeAgxGIM1rTyeNNNwt5yaOLloZnflucEUd/LxkiaqHjyjIRwDI0GZtUZy5p8irbTFr141SOr6aTPMY7F6SzOle5cqgQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y+XgJM3o; arc=pass smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y+XgJM3o"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-cbedf318752so2653879a12.0
        for <nova-gpu@lists.linux.dev>; Mon, 17 Aug 2026 13:12:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786997572; cv=none;
        d=google.com; s=arc-20260327;
        b=aBwwwXBJZx17FulQPsvPnh/fd/TVVDxsfI5VZAnWOK14kiIQe7B7hXHQQYsO2AaZZG
         PlGsatIkM2pRvtjtoyDdsn1moztezkfDtyzJyqc0agQXLj9PkuDJjX0Hq3HUvKSpkqar
         M44XutSmtFDn327tbxA11ckR5MWP29LEsIc0iQmS8hyNGSc4Hk6JY3SfunS0tmn8St0e
         3/27thEGQX6p6Kw4tvTsrsBpJfXvLl4X36Qp95T5eLB68lKwdAje4ebnxciuMxPmAeT+
         Boub6qhWW6TP8JLBcFO4xo1wn7XbHmzH/1C2qIjIKprPpeav/DLWLHlwshZGDCA5RJuZ
         vMpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=rmF0p5wb5vrcnie95iYpLQsIO/+hD7X9foCeks4E8TQ=;
        fh=TiF0rlMfsWXqjXwzwaDpxQF2OXk3hn0/sjr+Aq2HT1U=;
        b=PBmaG5xTuHLLG6b/88E+cMadPnzK5Ihw1MnKfFTcWmTFREjhhzMinweAggANlqyOjh
         9hHPDm8k5lIIQyqTVBkI17UA9lTkPuF8aZqxFdYfzIvRvxrXFNJWXAJBgmtuI6GuY/wg
         ZhMMVG/EZOYcYQcLqYO3fGuRKXC8HYE9L6Pkd7ObMMJIUtzTJBP3x5Ebhky4GBrymam0
         W0gePZ2Lls7CFGfVEvlOoXknFOJf5UpRjBhptR1EYyqmDi9oJoc6P0qeUlS8/ZvZ84x2
         WYlGVO5Vkd7wg/OMH5BBeM+uFxytQ3/vpdHWZEIXQn9YAsz0yNlJn7UnrqA1C7Vw7MDG
         /2SQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786997572; x=1787602372; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rmF0p5wb5vrcnie95iYpLQsIO/+hD7X9foCeks4E8TQ=;
        b=Y+XgJM3ozfgQJ6ZFEPAz7PXFxzYSG2EpofW4YB95uVK7EpJTYb6NCxAb2pfbPanuMK
         bNtUJkZvCAjiW00yZWpGOgpr/PXpY4aaTCplT+lc6xIaNuKNgqS2bMb8d0c69sHla6P6
         v9hyvbNudf6bIwXiVLNdw2J04rgCpv2OSD6d6YP7M8bV6/qZqyIwD5F2s1zkRSP9HIJf
         JsXHTpjN56QH6l77RDybbivVnkry2EM2FsLT97AMa9aR9pLf6C2tWorHIfnH5ebt2K22
         nBPMXi9XRRnkq5IDe72zEP8M/RDCKM/y1MNAFmPwA6K1ldC8rtdOV5aPzYBLNuOqFhQE
         i/Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786997572; x=1787602372;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rmF0p5wb5vrcnie95iYpLQsIO/+hD7X9foCeks4E8TQ=;
        b=TCsL062SGpdPcK/oDR+NSg58SAF63DPl9bN4lDyqIBd/79+F2dq+USIWkknWZ1K/3s
         OWFhwiugQuuUGBudl9pjrhfE40CxAb3zt1qyvrOY80b5NcLxT//PuC6Mu/zo/DOys3Bh
         dmYfR/pV9brSv2fC/ABJ7mQZrSGfBMeOsihK7p778111CBKeUuXR+7v9va9GzoLT4TAP
         RYPodnA1KmQjs6WLQm1FXJyFCCSv46Xw3zGTzIgu3GLUKotLDo4PZs9fzsPOLkAqR/oh
         HfbStuxWW3n8fv400oi7908V63mAf5cYL6BwETAp8LBVKNlRmLHiepJgGUz08h6PHiT/
         9NSg==
X-Forwarded-Encrypted: i=1; AHgh+RpJLh5KtYYqJ9YOfFoG2EZL4cPAWRjh0dMeSjdrPogg/9OxDkaGptP9PPoHNTYMxbZ+ZJ/M5pAJMg==@lists.linux.dev
X-Gm-Message-State: AOJu0YxCPRMGXdjgDA8xj3s89C7yx3kcHTT5t8w/ivenfPJD1dVG9/IE
	QSFgd7IN2cy9EjTqP6kkvsTDyhjjVwaNGotm/mRWMaZbmaQTbO+ke1cLzFJWs5o8ony1/FERr5K
	eB2s6Hu0dlc+GxNt7McgoMck0BthIlKA=
X-Gm-Gg: AR+sD13GCZ5KO+XPLxar388tczcCdvhQ5btR8ya2nnsuxIg113riVKFVncGyagPvwRU
	EZOW/oncWSPnBckVSzJzQTfeUD+blIWfjUAwHywdzRz32nV485bAJohan11WrBClU2hev8+jVU9
	960L24fgYaEwA9xHLL2yOYoO+36DHKROceTFpITJQmRsBMAIrNVfNSHwzTQLBRoiYSKS3uveg++
	qilAKYB7uhP4HvMaujX2XbURzWITdj88qgQwNlJpREt0B3EAn4L7EcKB/esDXmVf5ewyIPpG1R9
	o7EzZLFt/jmqbrHQTPPvR4HqbCkWi1df6lxEH8cPjk/0AtZgeA8P8g9qag8NPwJjhQsIKZehyIc
	NX6vuAOTgJZ+VqP7kjb7mK2guzB2j+A==
X-Received: by 2002:a05:6a20:cc0b:b0:3b7:807b:3cd3 with SMTP id
 adf61e73a8af0-3cc71cb2dcamr30661148637.23.1786997572429; Mon, 17 Aug 2026
 13:12:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260817-chid-v7-0-a5872e64d8f4@nvidia.com> <20260817-chid-v7-5-a5872e64d8f4@nvidia.com>
In-Reply-To: <20260817-chid-v7-5-a5872e64d8f4@nvidia.com>
From: Burak Emir <burak.emir@gmail.com>
Date: Mon, 17 Aug 2026 22:12:40 +0200
X-Gm-Features: AcwNN1XodtdSigZSPtT09IgGY6kHgbqKpKTjm9HggxTjtCUIibmVj2ooHM0J-GU
Message-ID: <CABwQupNAv1bpPF_J9owrHaENx9O2Gt1spaz8HNHyDy+uBXzKng@mail.gmail.com>
Subject: Re: [PATCH v7 05/10] rust: bitmap: add contiguous area operations
To: Eliot Courtney <ecourtney@nvidia.com>
Cc: Alice Ryhl <aliceryhl@google.com>, Yury Norov <yury.norov@gmail.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, John Hubbard <jhubbard@nvidia.com>, 
	Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, Zhi Wang <zhiw@nvidia.com>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	nova-gpu@lists.linux.dev, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 17, 2026 at 9:04=E2=80=AFAM Eliot Courtney <ecourtney@nvidia.co=
m> wrote:
>
> Add bindings for area operations on bitmaps. Each one is
> made safe by adding some extra checks compared to the underlying C code
> (for example, checking bounds) and with additional checks to catch
> likely erroneous usage if `CONFIG_RUST_BITMAP_HARDENED` is on.
>
> Add tests demonstrating the edge cases.
>
> Signed-off-by: Eliot Courtney <ecourtney@nvidia.com>

Reviewed-by: Burak Emir <burak.emir@gmail.com>
