Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F55833A014
	for <nova-gpu@lists.linux.dev>; Tue,  5 May 2026 12:17:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777983451; cv=pass; b=ea9ChpTZIsTm16Xfvh58JJwmd+q9nSF281zbXe0YTM4AaHXnSahUum2QWPOAX/UcyLoA6sUIZ2dmAYeeTRQgZhmUy9UxoYmk7c6jsJYgO7Nv8nMnyP2j7Br6hxDPnwIMj/O8GvjPu6ocMHF83gzc3X3ReqRflXwY7k5AniE3pS0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777983451; c=relaxed/simple;
	bh=4ydJKBzXl8vGu/qhevLAEpZeV8I3Agpri6WPhn0p5Zg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ue6i4FMiFKrzLtpob27Bzo1c+KE2l71/LVJYGLpjQtLXf4zUT5XlNTY3aHCXV+saoOjGITqiskqRUU2/MuCvfteiSlaJJ1blcWxyZWlgtbzb8Zu2DaWh/MO0B8RTWgWQVdmT3ip4M/fvqOsvMRuO5YPGYZsNaSO7k7/DfXG6Jvs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k3nMnyrF; arc=pass smtp.client-ip=74.125.82.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k3nMnyrF"
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-12db2e9b5a7so491789c88.3
        for <nova-gpu@lists.linux.dev>; Tue, 05 May 2026 05:17:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777983449; cv=none;
        d=google.com; s=arc-20240605;
        b=DedKP0Bu11MdveAtSPRsnSFzaCBFxEx8TszauqkoLlBf/WwKuXee882bs4Mg6F3n0E
         nVlKwG9fpNuZIzSWfMPtid31VqSVB9bm5x88dVL57B7kGJwPfXNiMkVUSdc1MveVQJn9
         XaM+bSip4Jxj7/LgbfvhLjdZNTJSdRGrYey92WIrC1QDrTrDJb+UtkOlqe/bho4JiLJp
         Dj/hIzJE6dWEOZ+D4S5QhIY+J3By1pC7YongHMVoQEb1WL+xqKSLKpHb0bF4UBtyR1Ns
         WWicqUr9dq/b3fOeqap5fYspXIAgnlrM1Nov9auctsxLPkMedWig5cFvlmior8bEoTfB
         TMmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=rh4nSzvUJ2lYZMblJZlYGda5GtEsMiN9Q4Lz0K9myNo=;
        fh=YdR7iReJMjPLuXA7ydH8w6BQEudPvEBPehBOSSsx5Q8=;
        b=l2jAi+w+syhG9GzqsVnePeQDwAf4OZewxIBv0fHFtUm/OXDmPa97zFuUvo7FsaL0jX
         AYNlV5qEn+Af5piQ3RfFvPbmqFk76FTO1qmYvwcvvRHIVMydPcA+SsXk0F0E58igOXUX
         SEUMLdwn/p9wfs/nLbpQWcQF2BpjlnOQO050cwtG6Bd59OwWYP55wNKar6zvL5Mn5wjN
         k0YIF11xWeUiNzpknUpaf+3rRY0srkv/9dmW3Nc95oLRTrcX92IsMwgXrvw4J75qghcH
         fqzC/BlTssC099GsH7wW5pW4+qtAvE9KEhDTO08/7fqpO87ucDdc7M+Qib4Pr+zuRHWe
         O6VA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777983449; x=1778588249; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rh4nSzvUJ2lYZMblJZlYGda5GtEsMiN9Q4Lz0K9myNo=;
        b=k3nMnyrFvT5JpgM6/xNYzRF0tRc7Tl0Stva2yxPyzvdKFFboJRK4gi4lFeQioCEKaF
         uwkmI5+KMF9T05nX/FzElPmhgX5B0dKqp38oKFZS82E0kWcYPF69YyNRrG/IgM29Pkq7
         G3plQq/LNCLYqrl4c45+jk+kskNFqOlFO0IGeH/SALrosJ1AWRnbKamMKqgTSyOhtvl/
         pWNhwgmAQkko+gnAsra1IqZfz5RHUn+lF+9H9HPp48lsieXQ3z87f3cuUzrDRa61vGWv
         788dW7h8FI+VQ7F7yTxJm0YBK+oz9/NpwWVRkNqsYNBnHliqXhRNTTxVRtc2C/qkIBzi
         tW8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777983449; x=1778588249;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rh4nSzvUJ2lYZMblJZlYGda5GtEsMiN9Q4Lz0K9myNo=;
        b=qaKAGtE9MetPHVS6uSO5DZuJJ4rHQCkZPPl6qXm2JQ6dyJOxdOewu9umu7VGSuCKTU
         XaQhen9lOUUqXGOsZ0QutcPcSx+ZUejtizXRKNTU5b2HA55bKO0PVGMNi518JS6O1vey
         /44657yrOUNGRSBGWQStqY5AoZlBj3uuO0GIIFBmJJOJTejvCyje2C0ZhNJkncckW12t
         +Jl33FuEEjVxfP7HQHvME49T50+xKpNCQSYfiWWBDuM6N4I8mJAMCyfvXjkgx474+UTW
         0Y61fBZmMog7+FxaVn76sCd8j0Rnt1IfyC5RjJq4LMd2gWN7Xldzd19WgwT/rpu+xB9z
         nTdA==
X-Forwarded-Encrypted: i=1; AFNElJ9plpqAtFjdBf2mJmh6IR2byDpqT11MuXi4JYAz+wjn0nsjOLx8cjvOTomjZQV7Br/jav7h6SNYhg==@lists.linux.dev
X-Gm-Message-State: AOJu0YwGkN3LEsG+sDPEWtcI1EXOVGxYl0EsR+x/ej4gWkvmTu99zmck
	8vMvI0aPJODma5WBDqvBPhwdVVvjOxxEMRm9v6b0Fi4W8CIqW7UnqbCS4vB58QkWjImyUC8fuIa
	2tRTdNDODFDnmpE29OUCFnWxuYTM37go=
X-Gm-Gg: AeBDiet+3A/C3bnyUN2znjIzOgL9jmPUpGjyk06tRAYva6frfohokK19/zoU5sDRVsZ
	ulB4JcVO7g+5G1gr91PQuOSi9Yi+kfxeLW/qcVXTUFI09l9bVaGcgjEzPs634eERYSk2KuiDomB
	Sefr7oJK7/mWbaG/xE1fMsdsvj+pEL077WC8WH9FjR1kRrmCpLK5PoT0cnVSdo/74cIP8N2bBxy
	jjth3m4DaB3qy79KBsLt8/N1ERwckOUiYX2hy8ubiJG9cbRQK+cXAlIk1tn2oLQ3m8r1JPBzFRq
	rfxsKOmZLzx+SZlgeI012FnCWYrtnAZ6XPTviUnB8BTX+rPU/TgqocNHOT6MwQXfD8pzV2CARty
	pdpfAmiCq5ZANJdZ2LItUPfqnI/PiG372vA==
X-Received: by 2002:a05:7300:dc04:b0:2c0:c55c:156f with SMTP id
 5a478bee46e88-2f41ddff527mr617567eec.4.1777983449127; Tue, 05 May 2026
 05:17:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260501205825.73614-1-joelagnelf@nvidia.com> <20260501205825.73614-2-joelagnelf@nvidia.com>
In-Reply-To: <20260501205825.73614-2-joelagnelf@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 5 May 2026 14:17:16 +0200
X-Gm-Features: AVHnY4IRsrOm00S5Cjdrtaixtaeoy2G18CIkU94qlj-QCX6kz6PrDy_aREt3VvQ
Message-ID: <CANiq72nW4ibDKYySiLo14B2W-PWbZv58d0a604cGQ_+A+ftBog@mail.gmail.com>
Subject: Re: [PATCH v1 1/7] rust: sync: completion: add wait_for_completion_timeout()
To: Joel Fernandes <joelagnelf@nvidia.com>
Cc: linux-kernel@vger.kernel.org, Danilo Krummrich <dakr@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, John Hubbard <jhubbard@nvidia.com>, 
	Alice Ryhl <aliceryhl@google.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, nova-gpu@lists.linux.dev, 
	dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org, 
	linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 1, 2026 at 10:58=E2=80=AFPM Joel Fernandes <joelagnelf@nvidia.c=
om> wrote:
>
> +        // SAFETY: `self.as_raw()` is a pointer to a valid `struct compl=
etion`.

This is fine since it follows the other ones in the file, but we
should say why this is the case (in another series, possibly a good
first issue), rather than just asserting it.

e.g. a type invariant?

Cheers,
Miguel
