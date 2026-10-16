Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com [209.85.208.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 782614D7957
	for <nova-gpu@lists.linux.dev>; Fri, 16 Oct 2026 13:54:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792158887; cv=none; b=oGo7MoQJvd4u6jvMnMI3pSBaIjQ2+yiNFsx0XrsLHBGyiUcCA5S44ts/CXribcsl9IXV6gQ6lHJdcvm5X2yJ/rUUQUFFihrj+OelQIJP42BfKyslVKrKZCr1xhtgJmQQP48SlnWxM2uQMz0334vy3gE2iOvTUY1vZeJBNN6QwDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792158887; c=relaxed/simple;
	bh=VwOW9LuuRP4zm4xzSacphrIEqTeIFqxhd0KQcV0jQFA=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=T6Kpp62/HXN+wIu68dqwchhgmmqMz7xCji76cusg14th59N8XtDd3dqBRjRsSrzQbgF699ulB0eZ/SvAIbH6i3R3aqXNWYu73Nd++vHWKWnmWeRsQFuEcJO7ZQ2HBUH+ehfXc6dAF80c8MSVL92twqXHmAZ38X9/Djx3IV1N8vw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=BsXaP1JX; arc=none smtp.client-ip=209.85.208.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="BsXaP1JX"
Received: by mail-ed1-f70.google.com with SMTP id 4fb4d7f45d1cf-6b1c2d36cabso5719760a12.1
        for <nova-gpu@lists.linux.dev>; Fri, 16 Oct 2026 06:54:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792158884; x=1792763684; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4RB0qRPK5JwVr0FFzsYrhcGUqlQtMIIbndksgD1L2mI=;
        b=BsXaP1JX5RWrbnWFfBvJJWgQlP3hIMV6z2fbpNLKRgxIF7Yo86ZyicL6+tY+q8KaKf
         PpQEGpU07Lh3JpOWBsWObnOIpWMsxTQQPI7mw62aROEDQ2BbbtZF3Btk/DK0FtPbVOo3
         H6hHsXw8dvJc/R5RpFcCNNvOebQmt/g8ba5SbVo5AR51poFZKhaYjIdKQBrrdTCAil6X
         KeS/3mKSS9/A8Dx38Z6wV68ewjb6+sN6/ZEiCeJNEd0MTUwSzBqnTQWSLH9F62KcHx8B
         K9ZT4gpVg551cm9OxMcelpNh9IdTkhQc4OWKf78r03fGgou08jKuviW6DErwyD5uQDGy
         sX8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792158884; x=1792763684;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4RB0qRPK5JwVr0FFzsYrhcGUqlQtMIIbndksgD1L2mI=;
        b=0CZ4lkmdhU2ZddaqVrwKledWo8O6Be8wDzjTi1Lu7trHQkD6c3heSJm14TI9W8wcOB
         iDnmxCJpY92D1uOf1zWQAJn5AXCrSpKFMfCatlg5A1mmfsLSE3UOCBDKYu2vWYFnM/r7
         2+Hk4ZuznwItBdocXmm04+OsbMVcItBtOW5nKj/W/dAqzb+NsgkISNIV1mFEY5ulY+Gb
         R/sjRYr1lMHuui+V2+Ab2SBtS4aCqzjGr2EL+5VcRuiT1Nk6JRTokXyNTEZNrMEMcQ64
         ky9r5QoOGsj50fxh3CKJdWf5WpeS9AhsJ3o6iGMHJWVnY6ElJJZ4/+u4LPpyVYpYc+FH
         u0BQ==
X-Forwarded-Encrypted: i=1; AKwUvByqgb+2EPl2kD75wqgkjVKrZJmyGkeWCBvmxwilPolnVqq0T0qB46D90Xkyx8LH1UPxvAwYDW0rKw==@lists.linux.dev
X-Gm-Message-State: AFq9FYKProYN261QK1tSPOQnfoDLJT33GXA2NwgJ3L7Q/2gzkIpOQ3Z/
	aEGBptvbaSuHkXP443CqgtsnbVFmMCK9gJVboLlaAJ+UORGQjokmJfc8EMG1DTs02M0lw9i0hwE
	nSz1IOZR8dP9+Zm4bWg==
X-Received: from wrwc4.prod.google.com ([2002:a5d:63c4:0:b0:48c:44a2:fe52])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:5285:b0:6b1:497d:1c64 with SMTP id 4fb4d7f45d1cf-6b17c293eccmr19329170a12.45.1792158884099;
 Fri, 16 Oct 2026 06:54:44 -0700 (PDT)
Date: Fri, 16 Oct 2026 13:54:36 +0000
In-Reply-To: <20260814230923.1292966-5-dakr@kernel.org>
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260814230923.1292966-1-dakr@kernel.org> <20260814230923.1292966-5-dakr@kernel.org>
X-Mailer: git-send-email 2.56.0.212.g129ede20d9-goog
Message-ID: <20261016135439.44716-4-aliceryhl@google.com>
Subject: Re: [PATCH 4/7] rust: fs: add iminor() helper
From: Alice Ryhl <aliceryhl@google.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: Alice Ryhl <aliceryhl@google.com>, acourbot@nvidia.com, daniel.almeida@collabora.com, 
	ojeda@kernel.org, boqun@kernel.org, gary@garyguo.net, 
	bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org, 
	tmgross@umich.edu, tamird@kernel.org, work@onurozkan.dev, brauner@kernel.org, 
	lyude@redhat.com, j@jananu.net, alvin.sun@linux.dev, 
	deborah.brouwer@collabora.com, laura.nao@collabora.com, 
	beata.michalska@arm.com, nova-gpu@lists.linux.dev, 
	dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sat, Aug 15, 2026 at 01:09:02AM +0200, Danilo Krummrich wrote:
> Add a Rust helper for iminor(), which extracts the minor number from a
> struct inode. This is a static inline function in the C headers, so
> bindgen does not generate a binding for it.
> 
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
