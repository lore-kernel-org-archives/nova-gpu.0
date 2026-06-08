Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D0432E718F
	for <nova-gpu@lists.linux.dev>; Mon,  8 Jun 2026 07:05:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780902336; cv=pass; b=P+3b58wd7VkOOEew8OPX4kaYARUNtpWFX+Id/lA76+uIzL6+ebnVhVOXlJDVd6z8+eskDI5VJvXipzedr+8T5niRW8YtOlGeNuFhhti4RdZeU5iBZjbhjIp/OrgyHU4H9XZXqRkDVoyQ4xCNCkEk+7BB2N39r5hjX15+9o9P8ko=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780902336; c=relaxed/simple;
	bh=9qA/8KwvDeFQOrwe6QRAt2Mp2y/gEjBhT+fubAMXObg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RtkXXo0Fhgyzx48YCaCAuO8+hW2P4cl9mUC63+fcA3dPmbIHbc0LZO3rQyuiGtl43UpvaUbwmABNnFCWAC1z+YRcc2b4gRpfkW7XMY4A6smupV5LGKLvgQCdyTMC/QYcuwQUds9obqCHzbS8rsW/jE4hOAzq32rCZESQBINVhsY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Kft/pFRK; arc=pass smtp.client-ip=74.125.82.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Kft/pFRK"
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-304f8e80b7eso264444eec.3
        for <nova-gpu@lists.linux.dev>; Mon, 08 Jun 2026 00:05:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780902334; cv=none;
        d=google.com; s=arc-20240605;
        b=Ly6GYJEpQpWCevI+atMzVWacm6to8MqpZo5UydhSi4nHhahUf3qfm0kERSopd6VjX6
         kRutSuheX6id6A1g82fPeSVQ7ZJz7+D/L14kqI9qvrMmNpJDIFLGdFIm2AYPU1Jf+QPw
         xrPk01KsBPAdtPZsX2o+c6EY7FDQ29aAXseet/U0k5eREhm+/11rWJU5eaA2dX+hvyb2
         EquRqEaflZl+RxKqFbMd4bxL4F8Qr32wSpV3aQX4n9pMzvBqc3LQZjeKKPCQXs1WVmmX
         m8Yof5BvkbuXP2ikW0ARFYenSZ0ZQ7s7AIawknbWZ9WxcOA4X2gFrutFQXE+rJHajdyG
         d4uA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=9qA/8KwvDeFQOrwe6QRAt2Mp2y/gEjBhT+fubAMXObg=;
        fh=4K8tUR+Ogr5aZMLoQYpjo9Jien+g9i0pMMKZ2C+pRvM=;
        b=NLQtMNQ27CJE/Kmeopou4ZD60StJ4ZJOGC40j8NLRY48VwBFZ3fQ8jvPe4J0GoPETM
         lHtrRlnd6cHxOdbsBMsNAJNUCYIbC2JYSmV7rbvJq/hESFkEP5sc3eBhsFK05UWm/7ve
         tKI9bO2u7OyaZY0qQ0Cl7yrmiEk5yUshCntVt2GcZJShl0zdW+lcm/E9c/z7foIX9SGz
         ueDw2rEzMIylyz2MVPAYQ7bsQbmsY4aSFSox5P1uMB2eBC9HsbuvfLcIVmQYzPu+UWmY
         4M5KgUbIJPnVaR/XqsQkHPG3bvT8SsJWtQS6M3XULEw7OH7pxJISLrnMAt6Ca2ufnXuP
         XTEw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780902334; x=1781507134; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9qA/8KwvDeFQOrwe6QRAt2Mp2y/gEjBhT+fubAMXObg=;
        b=Kft/pFRKFFTQgaB4vFMeEzPMm1UrYOlb74yMiWlLxEOL0cYqD2bp6qi/wMtlDybrUV
         ijfgoEG7X7QVmGYQcHt/ZaOItNIiLVbyRY9jvcbCMCniTyGLpEaVRer9oIVzBF9d8l6a
         9eKIWDFDNrQB6Pb7GY3KKEYZ0e3S3/72ysjyCSN8HfSJT8pZiTSOLY1G0H8Jsagst6Q/
         L3rdYZZsbLs1lnPy2Ui/n953mqtmsToQNTekIvYYek4YStUWBCKOqm1F3EldPYZgUZJ3
         qquBkHZXxtlhDRdu71RyVVm7fzxzgP1TwHG+TjOiSglmSZPGS8jLnjkmGICRqFn3+Fpu
         sugA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780902334; x=1781507134;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9qA/8KwvDeFQOrwe6QRAt2Mp2y/gEjBhT+fubAMXObg=;
        b=Wlb/k0nl1wbJJxYHmzS4vV0AT2x4zY2s2cXFoyoirwHDkayvRIursfouP6DF0XjuU0
         jIEYC9AkHJXbPiXd9W5qPpyxBNM3NqU4qRlH4aQ5RoCpRfLKRUMRs7i02aFOMvoDOey9
         OdMS2EaXHbN77QVIc+INu4jq/U07RXjyNoJkiKtUB5amJqXkuJlVjwSfZAQcxv4sb8c2
         Dlh9hygtM5GPvPdsvnhXYbxHZDyhAB2pJIFQ10xYkIsAuk83FF7EdMdO7vKANGcnsEMN
         orpS1aklhRDr807710LfKVADCXEDK4sa686gXbfuRMEZfTQWz7Cq9Kihj2oqb4zFjbN8
         k2Rg==
X-Forwarded-Encrypted: i=1; AFNElJ971clDgXpNZN8HgdDfJsg5AtyUNbcF/B7EQ50o635N0SODU7uSoEU8rQJLLHD2lFWLxBDDH/lSUw==@lists.linux.dev
X-Gm-Message-State: AOJu0YwWn79b3ihPw8hQ12kcSQtllBzFYFhJXtiaR4SouUSGw87fqpT9
	tOpTCNBkmvsg1W96OWk4G77q9V0j/OBa5KGPrayJ0LWUf4JD00vI6q81AdMVC0dCvfj9JrKO4Zs
	7AAYdow8yRezctwYAflBGN1Udp+XMwuY=
X-Gm-Gg: Acq92OFOb0dlFTa/TKqHgdc4nPFtUMTGDs9grIiXxvNZmny/rzHJc8XvD5oorqKDjwa
	YjF0+IvqQhrPjLHkQIOKRLoPc4157OdEqn7jzT4BQmhyIEg/P7OEEmZ66Q9VjhsXK7guljG4NS/
	pSbEqgAbYN9QaJbmNCSPaLdWnEFKB8kuN5jS94HprL0C4+FzXMoH+E0sY78KUnWM/uyOADJXnti
	+shlWKLfSodbuOV93PdgX0xyZWQ6yIqtpVdgWRrPbyjiJOTAGlzh0Z97595CCR/a8+u5fYe8JJJ
	i2vWx5NXmZEwN7ItjWpqt5/7gb1wykp26OocbSnqYSiQjUVAnX5brX1v2dgfFCaKFr4XyCGjupm
	bFYUqUWW4WGtfmXFWZa2SsEVC8vamOlEaRf0DstNZbC8/
X-Received: by 2002:a05:693c:3945:b0:2da:a813:a629 with SMTP id
 5a478bee46e88-3077b223afdmr3473571eec.2.1780902334313; Mon, 08 Jun 2026
 00:05:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260605-nova-exports-v4-0-e948c287407c@nvidia.com> <20260605-nova-exports-v4-1-e948c287407c@nvidia.com>
In-Reply-To: <20260605-nova-exports-v4-1-e948c287407c@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 8 Jun 2026 09:05:19 +0200
X-Gm-Features: AVVi8CeF1bmJ1otTtbNunaCFacq0cljAH1ygtuYHCVlQ1ktOIpRSg0gpBxWAiuo
Message-ID: <CANiq72=ceH60sCPs7UWDXQiV8GLznjDWsCKFa6k8O4exFEkW1g@mail.gmail.com>
Subject: Re: [PATCH v4 1/6] rust: inline some init methods
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
> These methods should be inlined for optimization reasons. Failure to do
> so can also produce symbol names larger than what `modpost` or `objtool`
> can handle.
>
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
> Reviewed-by: Gary Guo <gary@garyguo.net>

Applied to `rust-next` (just this one) -- thanks everyone!

Cheers,
Miguel
