Received: from mail-dy2-f43.google.com (mail-dy2-f43.google.com [74.125.229.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E6185012A3
	for <nova-gpu@lists.linux.dev>; Fri,  2 Oct 2026 17:15:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790961354; cv=pass; b=d313FWeaQMbyIZc/G/TUvfODA73+fBljHhu9WqpgrAQtE1lJptgJ7BpDxs7dhyz8nvt6qcxybBS1+WuTnU33Om5Z2DI+939dPc8rKzc1eVhODkguzrn001w+yPo7yhTjvQSaRKWlpFxxSCKtzkaMgb9INWXw9qndxwQFEF+zB5I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790961354; c=relaxed/simple;
	bh=EN1cEQoe0e3LCZQ89Wmj7iyw49pEd9peoNHzrA2Y4aU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PIuXcJ681n1/VoQEOdbmEDIt8F2lLyADFcTvViwnwmzbr8Oz+MsFV3Jqgvxt9xqWkEWNVMNCjWzDu95w7DTZRLvpyis3z5awdXK2KIK7F/MdQyHvowx23nc6civ/U6RJnGSynBP7+tc+715VDQlCWid0wG24mNJV9JV5kP3GPwc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hxrqyKDC; arc=pass smtp.client-ip=74.125.229.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hxrqyKDC"
Received: by mail-dy2-f43.google.com with SMTP id 5a478bee46e88-34b010e8c94so455866eec.3
        for <nova-gpu@lists.linux.dev>; Fri, 02 Oct 2026 10:15:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790961339; cv=none;
        d=google.com; s=arc-20260327;
        b=NLCC6l65oipJ7KSXfMZEIcmPJ0HOQEeLrhOMTxnAWhdQN0V9RxyQz5l0TQnUqhFpMV
         LJOn5SlFRVdzIjEaZxGoEzWSDBqD3pZpMuoK+qlUGiyd1NC0O7nF7rZWOJTunV7R4lIl
         jva0WRI41UCx6O3NE3xQ3b///fWV9EbKUrgYoPvg1gaSsl5mHJeBqD//9C197XNsqvgE
         SxCen3DEZ3mAHmtyciv6oQSvaDXnyL/rqbWAVHnWmmr5P+/05bNGcJQmpod58xJ/dFzr
         JDGKYPV7obeWgNeZKoFPZDMvhJxSnZ3b6RJYhLZ5hMU9NtkwbdQZV0MwGY9PAeIE5Lb4
         VPqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=EN1cEQoe0e3LCZQ89Wmj7iyw49pEd9peoNHzrA2Y4aU=;
        fh=9wFfV2QjVg7rsxXy3v6Paoau4qbwHj9cJMkfgkD6Eho=;
        b=kd6I39EAZaLE5FoL8Je+bOaVspNlh+92k97+BwqDEG34nIfAV/HFgdrw68HJlj2ml7
         nhetCfAmuHZ0Du3SX+bl9UUzOSkt2Z0mHr05r5krKpP3agmK3s/HXooO4hGbVdf5Incj
         05++AazRfxFO0Te8TQ3s90mIjiFoiU9PHLvuTH0qIaabsVTeV7TvBwieHP5zPhXhDWCR
         31Be9dwhqrr2MocNMiNE2f7lYi+VS9BAiRbuxOE/D9/XJaTlwJmycE5qBmxjoFONYdDS
         eN0P+eo9T7AG81+OYLUf2Mtll9tBcTwZFcj61nf2xfAZooMiyyBJA4DuaEVli0H7AjkI
         /QJg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790961339; x=1791566139; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=EN1cEQoe0e3LCZQ89Wmj7iyw49pEd9peoNHzrA2Y4aU=;
        b=hxrqyKDCuHupCQvLtaE3FjStg1xDRLIlQdf059EUv3YpACdv/5iP0TPPp4+C1sXB9E
         iS9BUryozD2XkL63+aN6/SUFmgNuEm0LwOQL2aJ63af/SkKCAIk341vHpTfPKBu5epq+
         GkrzC7HpyvH+ioY8NBqTNXpv8Brt7zDoK7nHi2jn/Nde8vl0uqEgpULP9f10Wt1iaU0v
         8Q7QrcV5jnRBbAzyQtHXl/gy8L/yKNQHEFia6WZBhI9BA04PPAoo1I/aPN8GpRrVxQqM
         ThgX/GVod88tmSHslC3zhw/XGq84TNvWAvhmNFecIg1NMH5lTQ90m0tNYJ/kGIEpQuIw
         ppPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790961339; x=1791566139;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EN1cEQoe0e3LCZQ89Wmj7iyw49pEd9peoNHzrA2Y4aU=;
        b=doo5vNzzSfaKbG/8mEp9P71QfD+CzRHMz1vWe4VSofDYVfMkrvurXtzvWAWGrev4C9
         kw3cZ8KHZKnPowTXkiU5f23WA9fDH5iEoHaiZV6cWWDiGh60LKc07cTp3wKp0YZFRBel
         ag7nS4wM/whbJje1zGVFeU2cLpUqcTGfWkZmVtOrT8Z3G57iZAe1E8F9grCkdCNJ/u9S
         SSz1OwonxGEC+M7Om8wlryacx5EyhjdvmbbDJIqJcXXicnqQAidy8OJkVCZlZe7WknIf
         kuE6mDHFFXnOc2O9hBGxvBaM9jVeRlccsVUy4Qp7kACltVsj34h+my0FkpbCgbLWWRa7
         lgEw==
X-Forwarded-Encrypted: i=1; AKwUvBwFJbhbqEFsHt3cntHuELrtaizKe1ITLKzIGt5Ce3lDZjyQqDjdglAg9zuw2jHbwEgHQhyWl5VfSg==@lists.linux.dev
X-Gm-Message-State: AFq9FYJi26sZ5bW8/sM8vWv+CFD2CrxkkLxxDDVT0z7VnP/Koaf+c9b9
	Ob2K3oWmB7+4EfL/wcmPBXciAfeRUoIGwtm1DhLcbUmPZ0kfwD7T56sifhnBDnCmNN44pF1+jkW
	igDwfrycSlsqrqsENsfI48sGfSOFBWdI=
X-Gm-Gg: AYBFou0ht4lCmml6iV6mgBRMKArgs69Up4zZqWORDG0uEyvXh2ThGiUkw7BJ6COGf1J
	jLbTz8OBiFPrPrx5/9aig/Wus7cjHecVx692PvwNKG06/TZMcX0lgOvw7mRU4Nd0iQR3ovsGgDP
	+TlSm47eijulP/ZMzP13ptpX44PDwd0POlyztN1emHsL9BXfgFxMEZfuHiOEUG+CEVboHl+78Gv
	kVMJd3txmumIlawppuyAc5/OmRyp+6gQW3skdkqrFfKJBw8WCPbxSfz0Numc+2u0zhr39g5Jq/E
	E8qCxcJnlaswSo9U99sRAeGSeI9hhUhzuky102wInD2QeEj5MiZIaLn/RDUfi9WfaHCrvd4VXMx
	Po6mtAvSkk0fbFxKlEga2e74UMO5Y5QIl47LgyT93eWVH9fOnZ4C89HRsciljFtcnk/jRMuwzOJ
	LqdkXyHZLTqgSzWqZAPs1uL1czRe/dRIv9bmLIl7SOZg2fxe/lLik=
X-Received: by 2002:a05:693c:8951:20b0:34c:15b5:b4e7 with SMTP id
 5a478bee46e88-34f1503d60cmr5903420eec.2.1790961339293; Fri, 02 Oct 2026
 10:15:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260902-cv-v3-0-0f90659e711d@nvidia.com> <20260902-cv-v3-1-0f90659e711d@nvidia.com>
 <DLFPWSS3LZSN.12G96EM0FI18C@nvidia.com> <DLHFKT44IHW9.2QWQB0O0LJHJJ@nvidia.com>
In-Reply-To: <DLHFKT44IHW9.2QWQB0O0LJHJJ@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 2 Oct 2026 19:15:27 +0200
X-Gm-Features: AclHuK8WU7MmTRz2zVr217nxxpeT8qmaOpCUrJpN90HnuhJSuc8jn6MdcGDQfTo
Message-ID: <CANiq72mrp7qw5jikznfRoWMjcWk3Vwm3dzPdWcC1AZ8jGzdibw@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] rust: num: add cv! macro to create values from
 constant expressions
To: Eliot Courtney <ecourtney@nvidia.com>
Cc: Alexandre Courbot <acourbot@nvidia.com>, Yury Norov <yury.norov@gmail.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, John Hubbard <jhubbard@nvidia.com>, 
	Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, nova-gpu@lists.linux.dev, 
	dri-devel@lists.freedesktop.org, 
	dri-devel <dri-devel-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 17, 2026 at 9:59=E2=80=AFAM Eliot Courtney <ecourtney@nvidia.co=
m> wrote:
>
> Will send the next version based on drm-rust-next, but Miguel please let
> us know if it's ok to take through drm-rust-next. Thanks!

Ok, given the recent discussions, let's move this forward... I have
replied in v4 with the Acked-by, although with some feedback.

Cheers,
Miguel
