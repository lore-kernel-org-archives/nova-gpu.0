Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6E7C3A6F0F
	for <nova-gpu@lists.linux.dev>; Sat, 27 Jun 2026 14:22:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782570124; cv=pass; b=FKmvYTBr93QbeJwJrxj2EtqEWRhUqzpGqgYS/9UAqku1f9QGj+mRGKpdW91a6dw5glvRvNO6PrXjGOISjvDdQl9tCJ0QMk+D7HGEh6pj3wyRYR+X17IEMto+u5Wk0YKYrnyXiKH5dlUiHGpZPVWYNTVbC3qpDsoY7qjce3WqR0Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782570124; c=relaxed/simple;
	bh=hgYR+me/WqBHOq1AxI3Al6Lomfd9P4rKWlIodfqB2Mc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AT871sqiobmg2RnPu2OcZfAhSkgMBYHKXYqeMQnR/Gdf/e7fdoMnFri3JgXemg6/XbVW+JNOjNSy3YbVbKRa6Djlb3qYoR5GiUxRM4RUb7JzWyKdsueNHx0L33kK1EsfgOdXBane0WioiaSyJ7sAyzdhhEYzlL1g/I5z51v4gLE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MEuklj8d; arc=pass smtp.client-ip=74.125.82.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MEuklj8d"
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-30c5912314fso232557eec.2
        for <nova-gpu@lists.linux.dev>; Sat, 27 Jun 2026 07:22:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782570123; cv=none;
        d=google.com; s=arc-20260327;
        b=kdn+RKhscVdqhWpdY3zobhJK7Jl1pa91xcN5M5KyvwuoVIEKtK+ZicLXX1ZSxINTVw
         NdKBAhvjk+dc4q/ZhtM9AlZf1GB2t6sneJmQSOM3qqGLsN3oVYVF6Kk7P3v2Qgxq4A1L
         NDaA7GDOa1ui6sS6ZIuyBQAyUTdBrtgiEswfn6T9nF5Zbp3kcZ2QtGZRMWtZk7hH0Law
         hnscQpC6OpIB35LynuEeHey/lRqUS2pbEq4JaM0vlJQKuhumJKGNGH37F+mHAvMfEioX
         yNzl+jGTKY6/o+go3IzHbECYtAi+ywnqte0pkGJWMWPFtS+u1jTCdrX69yz5HJ68lR7G
         H79Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=dnhPY84nbVl3Rm52MamXsK8B6ygO2wlFwCT+T0hkkOs=;
        fh=QCf4q6iWfShOgh4qc6uSMHgfcnAYekRzj0o+4yXFAJI=;
        b=P1WrZIPUPH57wOiuSqXRk5Q853mj/H2vJVkRbxx6U9e5KN6bjlg9682RMBJWVBCi00
         kSNTl9/vj3ORt/P+5AdQY6zdNAd69KKXXy4cDXD+wdp/8MSDJ27lAJlem/4CbeuVWCjh
         XcAQrwHYwccccGNbIjVB3IjR812FAK63kpfVh84kmP74nRa0VpuG/BwLZsNu6kHjEJ5L
         PEsVwVNc4jFQ8LB4DIqVLjkp+aXIeDLGAlhLyW+2yFrlu56inVFTACHzDahBZc/tpSrM
         CawtvMLokanIETrcirWC477sNiLexNFMZzTe0upevp7V1qsw8hSV8p46CTwtd496DSk9
         8nwQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782570123; x=1783174923; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dnhPY84nbVl3Rm52MamXsK8B6ygO2wlFwCT+T0hkkOs=;
        b=MEuklj8dvAKJ3J9BBDL+tlvMQUgdx2pFUGo3vGiS4h964E4RcjEg85B9hoyc3XXk29
         Srcv8dgxAZ90HT+eJCDDMzY2/b2MixWpPpAJFFxjd9FJ+0KXCB4ZapAAYDnLIdBjhhF5
         30PHSpQOK/ifyyDEo6/s6RMs8ET/o+9dLdrrg8J9Y5P+ocuRctMXA/buiCIeZNjIpEpl
         xYIgPuuy83OlTj/R4PUQltw5+4o1fBRjGQM1CwxEVyurG0GGrETCWaj0OA0L8z9v/P1h
         vz9LapQbSlD05MP4hOR84NzgGFXcI9WAVSbCfeCcM5B+TqFfUpdiONCo4adOkG0iqOrl
         QNLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782570123; x=1783174923;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dnhPY84nbVl3Rm52MamXsK8B6ygO2wlFwCT+T0hkkOs=;
        b=kOnvvrh402WFtq00s55BE4b0FBoqa2ki+Kk3BPxWtJ0KKw/aIDl7O4EnIng7hesGQt
         j0mMDZKuhBnqIpl8Y0BvWGKnDoYH77CYrSLmgT4gYGlxV74zZjpCYiPgSkbFSv2TIO/H
         XaV+/5ef3W4WuACwu7OLAJD24Kvozbgdm99vDHRqbuatli+xru1KvJpTC5wsS5sBMnXW
         piaFzB9OsAoUbUm7sGmk1W3nYoDownLMxsnLv69PoEJLLASUk4p/ttG0ZF4KUL0Vx+L8
         r7NTBPzBc3XwWqQ8wb1AUqF14sa7DSJnLZexwhQRaJegs+zgrnIDIhm8uwGX7k4A8kM/
         +8Jw==
X-Forwarded-Encrypted: i=1; AHgh+RrP5G+GH72tNcKWWsgWeRpGfqX9dQzwrzhucynfymOXdW/7O0dnDkZu32OxKK9a6uz+ZoMQkYUF3g==@lists.linux.dev
X-Gm-Message-State: AOJu0YxWwO0kz318Mmet/L/DrHoMSH0+JNi29K8saeWDiCzuTksXsCLZ
	OAVsjqmITmlBWgPOjlwbDm4Nwev/KI+YsCMkMHSgSMOiynC0ZmcH0pborCo8yo460N7T663UsXk
	TX+OsYPggw55U0b3ehktA7siBrXwJaWo=
X-Gm-Gg: AfdE7ckq1rhlWZPWMd0v2q8DVQfsRMx3IFahqy6vDpnCwu0+05k9My65+nyJYfCwIA4
	AZdqIsk5GFllQlTEsxTXvAJIkCdEaKXg1WCE88uzIS+TLRGzJ/D8yx0ezpJuc/6L3yOnRHG00uo
	aDy4oGfkdeUY9SfPXOjOuy4rBg/88nZqAdoIBbmL8UiQFCAAN2FcHyLiSkYPobbB01vqFf1lWOr
	QfCV76ZeOGxgwP08LV7LuqYOXSbhOnaJvc9SmYcF1SPzUdOVuoihGntV15SOG+65rhA0h2TLHT8
	v2RHqmiITA5Evs0OcSxGxo4jrv0fPx59roEGVplX5ygzm9fjZDa5qBB/Bh1rcY93kJL0JiXMIB0
	rzqEj9+UVDlct
X-Received: by 2002:a05:7300:ec01:b0:30b:e157:2641 with SMTP id
 5a478bee46e88-30c84d6411amr4636635eec.6.1782570122681; Sat, 27 Jun 2026
 07:22:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260626183630.2585057-1-dakr@kernel.org> <20260626183630.2585057-3-dakr@kernel.org>
 <CANiq72=0OOgc6NtbpF0Ysdk3ytRWCGGbWg00u0Le2AzQmKGKxg@mail.gmail.com> <DJJVPW8H183T.1927SIBS40Z40@kernel.org>
In-Reply-To: <DJJVPW8H183T.1927SIBS40Z40@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 27 Jun 2026 16:21:50 +0200
X-Gm-Features: AVVi8CctSDh_S_EW23arFCE2Q437EiWrwvRaI2YwlTvVdF9BNVV6NJ35O27uGtM
Message-ID: <CANiq72nr6UD=W6oFsJQaGrSFCRqyWnY80=SyNR7u6=eVQ7ci=Q@mail.gmail.com>
Subject: Re: [PATCH v4 2/7] rust: types: introduce ForLt base trait for CovariantForLt
To: Danilo Krummrich <dakr@kernel.org>
Cc: gregkh@linuxfoundation.org, rafael@kernel.org, ojeda@kernel.org, 
	boqun@kernel.org, gary@garyguo.net, bjorn3_gh@protonmail.com, 
	lossin@kernel.org, a.hindborg@kernel.org, aliceryhl@google.com, 
	tmgross@umich.edu, acourbot@nvidia.com, ecourtney@nvidia.com, 
	m.wilczynski@samsung.com, david.m.ertman@intel.com, ira.weiny@intel.com, 
	leon@kernel.org, daniel.almeida@collabora.com, bhelgaas@google.com, 
	kwilczynski@kernel.org, driver-core@lists.linux.dev, 
	linux-kernel@vger.kernel.org, nova-gpu@lists.linux.dev, 
	dri-devel@lists.freedesktop.org, linux-pwm@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jun 27, 2026 at 3:51=E2=80=AFPM Danilo Krummrich <dakr@kernel.org> =
wrote:
>
> The only way this could silently break would be to use ForLt!(), but then=
 don't
> use the explicitly provided safe cast_ref() method, and instead open-code=
 it
> with an unsafe transmute() assuming covariance from ForLt!().

Yeah, that is the not-compile-error case I was considering.

i.e. I was trying to think if there could be an issue with the name
reuse, since it can always be a pitfall. For in-tree I agree it isn't
a problem. For out-of-tree users, given it is very new and it is
unlikely they had that case, I think it is also fine.

(But e.g. if it were something that had been there for a long time,
e.g. in an LTS already, then I would say it would have been better to
pick another name).

> I can add them on apply, or we leave them as good first issue, as you pre=
fer.

Up to you! I didn't want to add noise/nit work, but if it is fixed
already, then that is great.

[ I also saw some non-Markdown comments in the other commits, e.g.

    // Invariant ForLt types (e.g. containing a Mutex)

  in the sample. ]

Thanks!

Cheers,
Miguel
