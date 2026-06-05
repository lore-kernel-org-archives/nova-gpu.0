Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3314E3CF665
	for <nova-gpu@lists.linux.dev>; Fri,  5 Jun 2026 08:36:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780648603; cv=pass; b=K0lG2iEOwcb1DM6e4lcXqnNykvTVIqa43Hu4pmsBXRW1GXdIZOImalNz7mWg10FV5nImVQoP9TvRFYFXK26ifMLipWTOFmlZI7s6Zpu8TsauIrNkn0sN+WZZzKVw/t68Si0Le1eYuQXu2RzqWgJ0JwQWlWzLRhJlX/0uLzgJLaM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780648603; c=relaxed/simple;
	bh=mSgvPmECu35Tw7MMm3j47U64E8vDrNkepG2EWMTevfs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ft4EATY/xjmva27h1ffn7eUFOdgZ9K8Vk5Kru9PcrqTkngpGhHQLUFwEp4OQI813Q8BbtTVAytjbjuA5lNvjzsMZfsLeythvKFIvEsG5KWU6cgaO0IdryIe9aj9dMxu0BhmoMgPfSkSM9lMo+BOcqncGucPGXy7nDRihA3jhBrU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f/h+Twc4; arc=pass smtp.client-ip=74.125.82.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f/h+Twc4"
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-304d2c56402so81509eec.0
        for <nova-gpu@lists.linux.dev>; Fri, 05 Jun 2026 01:36:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780648601; cv=none;
        d=google.com; s=arc-20240605;
        b=fOZXomltD+C1cIo5KAJ+o4qIL+elD6iJi/wVVXO0+2uZdQJpO/Z4QOIPs23HY2RtvH
         7BWi0/IVNg8GQBH1rau+sCQAe9Ny0qqN1nsxCHmvho9Z09+s0TnMy7FRk5aF+OhtdH2G
         DbyCVsxz95t6MG3X/MkmcBcOwLGXU6K+o4JunufYgc0mfByD6pCIg6PiNClBzcesHH/a
         KmKi3SlQUPlIJ7UYcklwamElt+IQtifDHxbUqj1peRmc19ytEGduB7oQODflvXHgV3iE
         LGwuTTQHlHLRqgHJAKM9gZo4MMxClpHqO1xn7xQvPDOZGDIQ1DG68nuzpCfj5LuxzpF4
         SPmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=mSgvPmECu35Tw7MMm3j47U64E8vDrNkepG2EWMTevfs=;
        fh=X567FidFHir8dYsyUJt3DGDVPQYMnzeeiMJTlGurC98=;
        b=eVYSDozUPVCiQooWZTHDpH+xiqn9rosWo2ilLh/+PNBrGKjT2RYv7pcy+7abi5cCfz
         1Vm7YZnhMXq4R1Iiu5qxb0GuDMBm9SVGX2GOH0AhBQbpkTJWr0lX+rIvrTSsXYU2usTf
         A3sxUYcKnyOy30oZE/6dt2cBFAZTWqFyXyhhDEiWpTuXFeD/Th2STppMNhO+CUxqN9IX
         CMCH/aR16q7ACZdXlGSQWEIsqoAxCuSEEk8KoVF85RaokZORmxNj6HIjHqYAFj7UnuI2
         TBXgyEtUI6+Mgb3YxyJxEULZfxFboZ+oeLO1uqhZQfzk4fMO/QX/+GRXJ/+mC55a+dDf
         X2uA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780648601; x=1781253401; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mSgvPmECu35Tw7MMm3j47U64E8vDrNkepG2EWMTevfs=;
        b=f/h+Twc4k6cFrCHvkvP7TU/F4D1kmLVcn+BocDZVV85l8tVXxViRpZYD2I/f0uUxQN
         mcRZKrQGVq5hmWDktHCJny1rQfnjpKvvOvAvY0poKwZd70Y3eUGV9s+NaSCX+6NYRcDj
         Dy7yrt3YGKwm2WJTUyq20I5UyHO5opBT05R3qjPrvEB5F7xriG8WyO2AQEpIfYRcm6j/
         f6fPj5bGa38DSwLAelWZsH3XJe8YXM/qw6rHGJ0J21M62NcMlmsZHYF7t2ACzDpRlVbL
         wbnr1r9J6qB0RrUe78HyIozuxihbr5AjD4btIEkDHQn8IsMfNB63bYxhe5UHCOIER6ta
         VK2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780648601; x=1781253401;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mSgvPmECu35Tw7MMm3j47U64E8vDrNkepG2EWMTevfs=;
        b=dDx/z6AfiWK9XrDvTPUjJ7lrcmeHs+qe86S879ARovrCI+iMyfWCGrU4wRfuVYKabZ
         xVKuPuP6qzbU037hnDl5d06sLoBhQkletAe081I/+Bwb6fCxDW8wVoFFlmOtLQb1MXwj
         xAB+ruOoPHCwiTbC4TQBpoKk7wOcieaYG79Boxhl2OwFDysgfpqLS5Z7kGpgC4LCRJDV
         r9x+qjDz6H1iEtotSZvbnA/nsG6O6En87oWLnOrHmiZ/bfw0ayji+oyLMBx9oETzT3ZI
         +hxerhERzlr4QO18eObpfn+kiRMbpym6+Y3idNyh6QMXxjh9If3o6xN6wvclRyUKBNu4
         HtTQ==
X-Forwarded-Encrypted: i=1; AFNElJ/DwlyREe7Wifqwxo7J8waUTzpk0T5wpasK36hndGOjV+RopgDA+9HLmhT9b/5+GRdeLK/oJSsLjQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YwulQMYA3M/LAJBT7TEV9/QewRYAgEBfZXEeVolCccDpknE0mCK
	Y4yHejGTVZOfxhSdjVrixzCjkynOnZwFKZN7434K4ElIK48wAHmfcvRCOgLcU+qc57e9VzUOyjA
	PE4Ev2SPVG7P5rgSrrN0UA/bcYSc9FPE=
X-Gm-Gg: Acq92OEJxInJFpakifefQzMCKoxwO3Ja8tWR48HgJzCO1Zpz5uU6X0Mh6o940hK3y7Z
	jCOjVuNrLk/aic1XRjNTGFsTLs3JrIGWNi30VBOpaLFh8r6c8JFBVN3hpJE7iMC201BTw28Ara+
	xNtJ9ptmPyFvpsBdbnenXAjS6mcNez7zRE3PTX4i7ZDBZC7yf2kKRRbskL64Q5zKBigZ9Jdf7lM
	WauCIuSTkNeqgOfBR7oJQn59fgIGajLYbq89BkijlcMQdL5xrWP5i9uW6KNDydgkQPmsNF2oM6O
	mA36+IsitiSDUI4Vr5fHmfgnbLnlP34CY5dcS++k3yyl/doxbu72m3MofPDFOLuBgEQ31CWPrqZ
	AHHyMidycMNh3RwtPHOaN7uQc8ojmdVmFTg==
X-Received: by 2002:a05:7301:9f07:b0:2d1:9b35:4f03 with SMTP id
 5a478bee46e88-3077b5eabbfmr547169eec.5.1780648601370; Fri, 05 Jun 2026
 01:36:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260605-nova-exports-v4-0-e948c287407c@nvidia.com> <20260605-nova-exports-v4-4-e948c287407c@nvidia.com>
In-Reply-To: <20260605-nova-exports-v4-4-e948c287407c@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 5 Jun 2026 10:36:28 +0200
X-Gm-Features: AVVi8CcQyHZaxrVm9l3w8nQkPTRE7ixo9gqTVbYy1F9Fup8-NkOcmlFkT0pwkvM
Message-ID: <CANiq72mFouTJTKePtQsDONZr2H=JbAEZOuGO6LoK4EVCSvAFOw@mail.gmail.com>
Subject: Re: [PATCH v4 4/6] gpu: nova-core: emit Rust metadata for nova-drm
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Nicolas Schier <nsc@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	John Hubbard <jhubbard@nvidia.com>, Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
	Zhi Wang <zhiw@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	nova-gpu@lists.linux.dev, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 5, 2026 at 10:32=E2=80=AFAM Alexandre Courbot <acourbot@nvidia.=
com> wrote:
>
> +libnova_core.rmeta

This should be already covered by our global `.gitignore`, unless I am
missing something subtle here.

Cheers,
Miguel
