Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 153513B9DAB
	for <nova-gpu@lists.linux.dev>; Mon,  3 Aug 2026 09:01:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785747683; cv=none; b=pOsrOxT2dBDr5A37X5B6m6cJ9pd6BOtm8ULl7RLWygX82aTqIZ2CZIR5l4puACK7L3nsCxr83nMqAtAaQ1AiiizdQzf5i1XpWIrQBzGCJoN5K7678rEiVA7gW7JAuU5PFU/wbOChB0e2Pj6xIomfeKyqcnaFYqwhVBMgBhIZ3N0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785747683; c=relaxed/simple;
	bh=A6jrGJQtDJIL30mxb3XxVFNiY/hbrxZT0aR9eyUYw4A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MtvZPnEbvwWjPZJ2Lhy+3sbL9RUWK5eX/LpeVCQtH1SDPfGHFsjEy0m37Dqd/3wzApv5T4JYbNL/7PHGqR0wzdXgJTrCz4YsxnlzdCtHjWlTjRG14FGI/2BOdFf+R53zU7ZZtL3AsnUlJnw6ZjF0NX6PwK9yBiLtKORukzO5S9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=InVc9/PU; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="InVc9/PU"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-4798bea72f9so2195828f8f.1
        for <nova-gpu@lists.linux.dev>; Mon, 03 Aug 2026 02:01:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1785747677; x=1786352477; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7c8ajU7Bc5fO7IMCQU0cwsLx5uJDTGm1qTHU9/J8vs4=;
        b=InVc9/PUYO47aWOHZV4pL+LzkbF1lTlCNR43eIQ6ynZI1xrEFb+C1gAwfVbKKAd+zN
         72L3ICyXCvIc7qWCDyTHzffF6RBjcej0F2QiUZNYkiuoMNkJKmR53khYmEam5RmTQmss
         JDMhg7q5VjZrumZKOjWUT5pXYtl9+t3TSxQUVjoD3+GzURyzQBajjEjh3YT0CPl3gzh8
         Dy6bCK/ATwcMiYxIjgfeO3DC0AfNRthkxwklv2MvIANbp442pU0gOOI04QgqwhQPFbD/
         CuwewlUEzetYQjAs+XUEpnQLlOSv5on/oNQ+GQbmTrflvPvF63QwfX0uZY2wt7ARAbA7
         zCCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785747677; x=1786352477;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7c8ajU7Bc5fO7IMCQU0cwsLx5uJDTGm1qTHU9/J8vs4=;
        b=lcyIWQu7DWZyJnm7yqByTIqpvgH8LI/PFFQvzHV1gZdEn19pB0m4+h/gY2vOsi4GX4
         nmgp25nYwrpQ4xeXh5/VARCM6+jBQ/Z5uEVD73J6IsMVjF2AKLU0N5burlFHaC3uKJHN
         +KBSM5Nc1CQ0HWhFSTRZ0oxD1MqjLUfuI+QKeTisv0j3lFWwZTqspm2NlrpFvUrJNPZe
         mHuGPqJcTpQ/n7SSkZ/36IBctUy+htzbUlTI3wokqdg1xmzVRIJH4UOeZk3RvsjEjjkd
         cNQZwDK20oipdH909vpZdWpki0C3wy44lZpO9H8Jo+U0+hF3sHZTsPjxY1rFhfs8khYn
         yX0g==
X-Forwarded-Encrypted: i=1; AHgh+Rr+seVuYJ/aFS68TujA+3Daa66Xl+bDNZFXUHqcDq+dD2eKGIzlac2SFA4ipqERIW3HI7V7F/4ShQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YyQj9eDEGUMLn/9AQ1VG0XubsrGBuaN1lEmiChyh//ZTO0Pr8mk
	HceRecf0ZM3kMn4PXJY/g38bTGKAhVVXuY6LxXcM9J7eofLa/a82VuT5jqnjYQojxUk=
X-Gm-Gg: AR+sD13Mvu3plYsybiSHpJRfO4CylmXjN0ulR8Dt/AbVFAqDpxwYbEYn5kO4HPYE3DX
	GN8Zt7DUAj3VrPK54OH4k/Ktr00y/AF65g6TSmgXACB8qkVsu+7GipW5cXH8YBOTDiYGw7s7uQD
	lpdF8/PXTHS5MT8rdiP475dqYfP5wbGbjVVneL7IIacyA80YG3nIHGWfEtmhbqxpkuGKVPDWW3s
	GQR8ZOPdLA6SyUq8BaObTtQ58aQlJ2Gqi5Ixt0lG0q4irqZm3cIxHJmCIxNnD6rvlj7V8mjZPiD
	XEmF/DwTcThbEuxaPm07LMjzZbyz4iUxnV93dFKpcyBD/+CI4PM9IJwzVunb2EptMdi7mo356YN
	rfHACyiXbrSEGuur//7yKDy0tB63FAc7KzRWUuylch6l/QX8SUqq4kEqiYMSF5d5HpHVW14HhRU
	EP20UJFjMzTJYyJG2cwJpxqCToY+1lVHmQsVL2Ez/HzundYe5TDLI/MigcsljRVLAj0LjVGBPmx
	qJFr2wBq9zdokCDdVkz6JbKSla6oMLeEGoNCvIE827CcYJdCrlo6jnYZnJGaW4zkTfqZpAf6q9u
	dtSeNOujCAuMRgjfcZ2++qW7+UYUuNw=
X-Received: by 2002:a05:6000:481c:b0:47f:8ac0:ccd3 with SMTP id ffacd0b85a97d-47fd9fa5e61mr20758749f8f.2.1785747677195;
        Mon, 03 Aug 2026 02:01:17 -0700 (PDT)
Received: from ?IPV6:2a00:1028:838d:271e:8e3b:4aff:fe4c:a100? (dynamic-2a00-1028-838d-271e-8e3b-4aff-fe4c-a100.ipv6.o2.cz. [2a00:1028:838d:271e:8e3b:4aff:fe4c:a100])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fd458b73asm29125053f8f.29.2026.08.03.02.01.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Aug 2026 02:01:16 -0700 (PDT)
Message-ID: <7b24e554-0f13-40fb-bc04-dd64cdb93528@suse.com>
Date: Mon, 3 Aug 2026 11:01:14 +0200
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 09/10] rust: macros: remove `THIS_MODULE` static from
 `module!`
To: Alvin Sun <alvin.sun@linux.dev>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>,
 Luis Chamberlain <mcgrof@kernel.org>, Daniel Gomez <da.gomez@kernel.org>,
 Sami Tolvanen <samitolvanen@google.com>, Aaron Tomlin <atomlin@atomlin.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Daniel Almeida <daniel.almeida@collabora.com>, Arnd Bergmann
 <arnd@arndb.de>, Brendan Higgins <brendan.higgins@linux.dev>,
 David Gow <david@davidgow.net>, Rae Moar <raemoar63@gmail.com>,
 Breno Leitao <leitao@debian.org>, Jens Axboe <axboe@kernel.dk>,
 Dave Ertman <david.m.ertman@intel.com>, Leon Romanovsky <leon@kernel.org>,
 Igor Korotin <igor.korotin@linux.dev>,
 FUJITA Tomonori <fujita.tomonori@gmail.com>,
 Bjorn Helgaas <bhelgaas@google.com>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 =?UTF-8?Q?Arve_Hj=C3=B8nnev=C3=A5g?= <arve@android.com>,
 Todd Kjos <tkjos@android.com>, Christian Brauner <brauner@kernel.org>,
 Carlos Llamas <cmllamas@google.com>, rust-for-linux@vger.kernel.org,
 linux-modules@vger.kernel.org, driver-core@lists.linux.dev,
 dri-devel@lists.freedesktop.org, nova-gpu@lists.linux.dev,
 linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com,
 linux-block@vger.kernel.org, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, linux-pci@vger.kernel.org
References: <20260723-fix-fops-owner-v9-0-c1c3af7f7bcb@linux.dev>
 <20260723-fix-fops-owner-v9-9-c1c3af7f7bcb@linux.dev>
Content-Language: en-US
From: Petr Pavlu <petr.pavlu@suse.com>
In-Reply-To: <20260723-fix-fops-owner-v9-9-c1c3af7f7bcb@linux.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 7/23/26 4:10 AM, Alvin Sun wrote:
> All users have been migrated to `ModuleMetadata::THIS_MODULE` const or
> `this_module::<LocalModule>()` helper. The `static THIS_MODULE`
> generated by the `module!` macro is no longer referenced anywhere,
> so remove it to avoid having two sources of the same `ThisModule`
> pointer.
> 
> Assisted-by: opencode:glm-5.2
> Reviewed-by: Andreas Hindborg <a.hindborg@kernel.org>
> Reviewed-by: Gary Guo <gary@garyguo.net>
> Acked-by: Danilo Krummrich <dakr@kernel.org>
> Reviewed-by: Alice Ryhl <aliceryhl@google.com>
> Signed-off-by: Alvin Sun <alvin.sun@linux.dev>

Acked-by: Petr Pavlu <petr.pavlu@suse.com>

> ---
>  rust/macros/module.rs | 16 ----------------
>  1 file changed, 16 deletions(-)
> 
> diff --git a/rust/macros/module.rs b/rust/macros/module.rs
> index aa9a618d5d19e..23b6a1b456b80 100644
> --- a/rust/macros/module.rs
> +++ b/rust/macros/module.rs
> @@ -497,22 +497,6 @@ pub(crate) fn module(info: ModuleInfo) -> Result<TokenStream> {
>          /// Used by the printing macros, e.g. [`info!`].
>          const __LOG_PREFIX: &[u8] = #name_cstr.to_bytes_with_nul();
>  
> -        // SAFETY: `__this_module` is constructed by the kernel at load time and will not be
> -        // freed until the module is unloaded.
> -        #[cfg(MODULE)]
> -        static THIS_MODULE: ::kernel::ThisModule = unsafe {
> -            extern "C" {
> -                static __this_module: ::kernel::types::Opaque<::kernel::bindings::module>;
> -            };
> -
> -            ::kernel::ThisModule::from_ptr(__this_module.get())
> -        };
> -
> -        #[cfg(not(MODULE))]
> -        static THIS_MODULE: ::kernel::ThisModule = unsafe {
> -            ::kernel::ThisModule::from_ptr(::core::ptr::null_mut())
> -        };
> -
>          /// The `LocalModule` type is the type of the module created by `module!`,
>          /// `module_pci_driver!`, `module_platform_driver!`, etc.
>          type LocalModule = #type_;
> 

