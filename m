Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com [209.85.128.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38D5C4DA9AD
	for <nova-gpu@lists.linux.dev>; Fri, 16 Oct 2026 13:54:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792158889; cv=none; b=KRmlbUdNXMfhOU6Jwdia6Z9iBgVV+3+9RWuLS9b8pNAYQ7LPhGWADeEvQQML9yuftV4xNq1lZR/iJMtGOIbLP+AN2zjbrb+hi3maRt8urBM0zyClij3X696QHng71odU2EkolmGhHSudUZx9LG2Ewy9eahY+IPjA0PXSQFuSyZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792158889; c=relaxed/simple;
	bh=mqFXmG0+82kD8GDDaPBco0UAnX0A+bUqnYurXQmfV1Y=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=YCBJfGynBD+UTZb7gyAbBe6ygJDkX70QO/UHmNoAQnVuTN0HO0DpcPE9VRR/FOqY8NWkCltdINuGRY7lUO41IpGiyse3t7/gtSOr0W+G+40EhW8jOgEmceraiwCVxYzVkQDVkHcM/wg6yyThF6WTxOFsMPR8/bDzunmZnpC7swY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ZcZ57FVu; arc=none smtp.client-ip=209.85.128.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ZcZ57FVu"
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-4a17574b5easo23962725e9.2
        for <nova-gpu@lists.linux.dev>; Fri, 16 Oct 2026 06:54:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792158886; x=1792763686; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BRDYyfM7TkTb+fgJiC0WCgOCCRs4w4XpNaptrf9kwKY=;
        b=ZcZ57FVuSyTetGpnCoyRCKKxIKAYT7xilv6CUCJhMRgua4lv6Sr9/+qmM9EZr+fpjD
         MRoSRHB+hUTe+hmT6JOTV5euaxtSYRfgbGPtH1/hAWWUtqYY66ea1+t3jkp7RYwxBNeN
         Nipv2qqCva6HtlTsAM+v86g6jJonWmbGKOiw2L0WtvXIWQYWj18fjpSa4IcVGXJY9/6b
         dhEE1wfPDOjemwUQ+TKFNcw/f/yL4R+TQeQlHlKYHS/7eGjCBcg+UmH4G83cn5Ak7aaD
         u/jNcmSWMFh12oHNpkSfyP3qyzz88vf/ry8X6dyLOH3kxolCb4cc9x2SVU2jwTOSZ4fd
         afcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792158886; x=1792763686;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BRDYyfM7TkTb+fgJiC0WCgOCCRs4w4XpNaptrf9kwKY=;
        b=XzdNQ0dyysq2svfHjyXuz60Gl6ryAcN9JKTXrSSMWsDvqRvI/wmGE64kTpyDNWigET
         Q4DsR2DxMdj0lk6zox/hpx2biEAoWC3mRPghH5Yt76jCxeqKAYvs7z+jckkuIl43I8gt
         os7+PNXQsYIm6GspGQFHJN3ueHChvVtnoR5Kpg+cscy65uRH9nDQbxRLMEjl//TlNa6v
         1f2eqQ9qMGmJOz2RSzITPOTiH6HK0QRuCIOFu947ckiyTs0NhKrMvJSrmefle2S3Mepz
         91YVkWZHNqu0h6jZDu0ZA4RN8XtO06CF/MWv5ZfQEAayf+elAC9EEpDU+CoG1xjH/WOp
         WUbA==
X-Forwarded-Encrypted: i=1; AKwUvByTErksA8Uj2Dj2l13NPKDoRGZ4NWDiNbKBklmZ9k2buaZ3fxm8W7JVF1671lTukXZ3CZiYiIs2rw==@lists.linux.dev
X-Gm-Message-State: AFq9FYJYvD6RxcZ8/W4svLqmpZDUGzHwxnN6TI9fWJwrcS3hVisCUaPH
	fVetAVC9nSsHci4rr1+n2FFsq0KoaH5+iAEewAp4SjN+/CN9hbFWZ/CcN+wvLnY3fBi1cpUl4Im
	SHbhiRwoAlLoqO9z8EA==
X-Received: from wmaz19.prod.google.com ([2002:a05:600c:6d93:b0:4a1:99b0:134f])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:4708:b0:49d:15b9:2a2a with SMTP id 5b1f17b1804b1-4a18e47a8a5mr488323585e9.10.1792158885671;
 Fri, 16 Oct 2026 06:54:45 -0700 (PDT)
Date: Fri, 16 Oct 2026 13:54:37 +0000
In-Reply-To: <20260814230923.1292966-6-dakr@kernel.org>
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260814230923.1292966-1-dakr@kernel.org> <20260814230923.1292966-6-dakr@kernel.org>
X-Mailer: git-send-email 2.56.0.212.g129ede20d9-goog
Message-ID: <20261016135439.44716-5-aliceryhl@google.com>
Subject: Re: [PATCH 5/7] rust: drm: wrap fops open with RegistrationGuard
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

On Sat, Aug 15, 2026 at 01:09:03AM +0200, Danilo Krummrich wrote:
> Add a Minor abstraction with RAII release and a fops_open() wrapper that
> holds a RegistrationGuard (drm_dev_enter / drm_dev_exit) across the
> entire drm_open() call.
> 
> This guarantees that drm_dev_unplug() in Registration::drop() waits for
> the full open sequence to complete, so all files are visible in the
> filelist when iterating for cleanup.
> 
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>

I would consider whether drm_open() should be changed directly here, but:

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
