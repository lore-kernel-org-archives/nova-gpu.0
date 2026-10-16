Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com [209.85.218.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E67FF4C9DFF
	for <nova-gpu@lists.linux.dev>; Fri, 16 Oct 2026 13:54:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792158885; cv=none; b=KRTsRR6ChgRO4OTipjbyudRnTpWoZaSc3kGW9fJUzngTCmVpDuQ2Au3fCZc0FYtL0SvcpOpwKN62JkhWfreFwabI7s2sjOqIQ1o5sEQp1mIHg9FYlRyvksOqYTrDY2ntSrgbopihW18jlG0stHOpha7g+MXFOnGOcH8+0TggZpo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792158885; c=relaxed/simple;
	bh=deHPgZF7ogGMiSKR7XCrVK7BhURB4dZRyrwFrmzyzTA=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=VtL3VRQcgM7ha7ztuvkTlSbdkStIjDIyodoi3GHy/d9RhE64e69CFYegOIY4W+nQ5uST9uA6ZGd3PfG6/nkaYcUF+VpyxkIi4kWH43XYN4OQ0NeH+9Q4DQ90jTozI9zRbM9uC10vF1FyxMFI34fkvJto5B8XshOmw4o1lTvb5o8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=TYs81EDG; arc=none smtp.client-ip=209.85.218.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="TYs81EDG"
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-c3613c35145so555631266b.3
        for <nova-gpu@lists.linux.dev>; Fri, 16 Oct 2026 06:54:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792158882; x=1792763682; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xqeqqSt0YOpLVQ4yu04gr8nCmmHhkZ/s47wtOe1ej+o=;
        b=TYs81EDGbz978/Ow9KfFX7LvAnhZZdE/QUfk8GwCyC8B5S5Ty4V69+PhKdLWQRkZ01
         eiuq8g4j1uH1eEuDCOQiEb0dPLurHfwRD8eE5NtbkOQAF++IH3VmMGH0PwWj8R2rg7PI
         tLDp4mqBmyXWj5JJ7IuD2eN4cjCjbev3QuSNgG3qC8p9ulmpJvgO0TD9u1TdgGAV6R61
         48LXgRdpjdwc3Gx/G84VVMl3Qxm1f+zmuijavWSYxUawWufy7qktlll3Dkw/64CJV6N5
         7gnDRqXIAVuMa3P5vFIhYuSkv43cQ481kIxSJHoJEIL/1GMcQe97Yl/r9UBrU4dJoW4m
         jAFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792158882; x=1792763682;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xqeqqSt0YOpLVQ4yu04gr8nCmmHhkZ/s47wtOe1ej+o=;
        b=rbxpwMIIbRkKjNA0vHQQ6uR9rbCMs3SAzuhxUpY0ngtQTYP/V2kfRrcB+6hMch2xnP
         mAcllGDJGga6VwOtU2fUOwOe5RSks+OUaOAykVvPquZT6Iskp6qpCMpQhEDJCGX238qx
         wIMvld46EsxJsvFkR4JzTGpJFQrQoOmKrwgto3SVdNPRK/f6EU6RFvbOgXWv0mcGb4/Z
         Rn+CNlm1xPe7+tDWhcJiRZnsRAqlwwTzEhrCzlGD7HSj4n0QE7sK4R2fpJ0tvAhguwyM
         xrKnhAxC12Fwtne/DNXNyIB8+p1Ax1d2ZpDTxEQZpKy30+eOO/RAZz7s4sDULzLAV1Dh
         Q7vQ==
X-Forwarded-Encrypted: i=1; AKwUvByFqa0LqsslNH80rsDgmEvCWO6ievpH7VlEIJZzFHVU/r0sEkCyUhZjLJjBpGRjLt5itBsa+ieCMg==@lists.linux.dev
X-Gm-Message-State: AFq9FYKeOTkfihWneKhm3RzbqG2YCJebG/lcBayGA8aNQSiaaCYiuKo6
	N7kIbZEKm9LdE+3lLI7Z+5dQtv5Q19jd9JTtwEAQQXPPUKr58wpd8SJnYyNPnaLjRIax5Japtl6
	4FoKYCWyE/TgHh9DM1Q==
X-Received: from ejbrh8.prod.google.com ([2002:a17:907:20e8:b0:c35:81ab:15ef])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:907:3f20:b0:c3e:e726:9548 with SMTP id a640c23a62f3a-c3ee7269fcdmr508329766b.14.1792158881705;
 Fri, 16 Oct 2026 06:54:41 -0700 (PDT)
Date: Fri, 16 Oct 2026 13:54:34 +0000
In-Reply-To: <20260814230923.1292966-3-dakr@kernel.org>
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260814230923.1292966-1-dakr@kernel.org> <20260814230923.1292966-3-dakr@kernel.org>
X-Mailer: git-send-email 2.56.0.212.g129ede20d9-goog
Message-ID: <20261016135439.44716-2-aliceryhl@google.com>
Subject: Re: [PATCH 2/7] rust: drm: gem: gate open/close callbacks with RegistrationGuard
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

On Sat, Aug 15, 2026 at 01:09:00AM +0200, Danilo Krummrich wrote:
> Wrap the GEM object open and close callbacks with a RegistrationGuard
> (drm_dev_enter / drm_dev_exit) to ensure the driver callbacks only run
> while the parent bus device is bound.
> 
> If the device has been unbound, open returns -ENODEV and close silently
> returns. This prevents driver code from accessing device resources after
> unbind and is a prerequisite for making drm::Driver::File
> lifetime-parameterized, since GEM callbacks receive a &drm::File that
> could otherwise be used to access invalidated file private data.
> 
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
