Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com [209.85.128.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5546C4CB8C8
	for <nova-gpu@lists.linux.dev>; Fri, 16 Oct 2026 13:54:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792158883; cv=none; b=FB6A3sd0hG1uPH0YOc3IlTWUJgo83L1rgU8ZZYL7hUBHWCaZhoV4AUY44K+qKrnMsMyJrwOYLlIlYCX/nSikzKM0hAipZH3NLKHltcRQi71q9K5JT8syUKHiwkEFMjIu54QSecv2js+1s6INHJN8PHKu3bNYhGlvn8v1H3l67zY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792158883; c=relaxed/simple;
	bh=pJ6+d3a1HLi/s62noKNGIdAvZy/I9ZvUQt5ijvaKBoQ=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=BEQcS/AjWHdqra1kMUJYxzwhYJIPxaeTa+8JJgbKW6FOhEKPh6wbmQxu5TFKh4vzfhLpZJJjodCWkayOFZ35f8jMNA0diEa08FzP9sDGHo727B3x+KXlfbcy641EsZkHmJnBMUeOXVRhgHAdMH+1VZ4NW1wWJWZ/9BZK4dPvO+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=VOtuV0cn; arc=none smtp.client-ip=209.85.128.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="VOtuV0cn"
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-4a1b11e7837so33784815e9.1
        for <nova-gpu@lists.linux.dev>; Fri, 16 Oct 2026 06:54:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792158880; x=1792763680; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mwy80ECHA03ZxNI6fxFklBBGHCRE1D2wF/JjDhNvW1s=;
        b=VOtuV0cn6SCQD06kUSAjO8RPRYgLWTscG17B3mJkCgzcqxxXqiP/o4XDerEB/kGRZA
         3tH0qr7/LE9p5OpawrR6L4Z8OjQmEnU8Kn9yzjYuUNvfZOWuqPvggFQy5UpI98+8ddil
         0lKmJsxxjLsSy97Mkh2H73Ywpz8ZXh2gIQaippN1a+8RL9X8ySSmlChQW66jkE8wafh9
         RymxofAgm+AO4REHPXFogCkFSgiTjJvkiAL56YBDCX02JuS5HT+/KFy6e9K//30q6Zs8
         1vk0151w/uEjzWC9mPsaCEekTsIWSiNmVMiX1tVGUP0gf7JaMOFeBJC9blA9G24YY8l8
         rT0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792158880; x=1792763680;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mwy80ECHA03ZxNI6fxFklBBGHCRE1D2wF/JjDhNvW1s=;
        b=TGNsiWyAOguJV8iNVXrpti16AE/Tzli4umzK/3UZAf+ODRaT4xtEcK6LEPgkW5CgzY
         TWLQMJKYRUbrUUMeYArpKZiHPwMpmG38eHCHWa0dUzYlnb8O6k3aMgFxPqtWopua2vSn
         bm9ZWwuEwyFw36JSKRFyLN4FS3PimC9Nvf+ROWXOc5AhD/Z/gdx8AHQ5jQFOpKPyLMV5
         FpOZNzWEwOVO8lO/Nd45aK65Ehr+hqy0gyd//mQPCdek1zL+8S4DeD9bMM5S+js5HiiH
         V3QatkTZnc/7xbjuSm27phXYmNaOllmeLFN2aG1AWufB25eV0bfriTla5141Le2jWKU1
         qKsg==
X-Forwarded-Encrypted: i=1; AKwUvBzi+GMyqIPzWuvkQIKHXRwGeTLtFcMIMV4n/nQ474zWCTiwqN8GpJOjtoOppzEZcUS87+gshzjBTA==@lists.linux.dev
X-Gm-Message-State: AFq9FYLf3b8wCDfQP/rzkOKeHaMjtwJSyB1BUObYZ0Qs7BeJvQwxVhM/
	dhpi4YpC5F5S831gM1FQjco0ziVaH+Id1tvdJkeRqHT+1ke2AP/HQvs3RvJDQzWBWj+5x/AU/V+
	DNHzZ/aoKpXm74iHMSw==
X-Received: from wmph24.prod.google.com ([2002:a05:600c:4998:b0:4a1:9c0f:883d])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:c049:b0:4a1:9a97:c88 with SMTP id 5b1f17b1804b1-4a19a971118mr271601125e9.5.1792158880287;
 Fri, 16 Oct 2026 06:54:40 -0700 (PDT)
Date: Fri, 16 Oct 2026 13:54:33 +0000
In-Reply-To: <20260814230923.1292966-2-dakr@kernel.org>
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260814230923.1292966-1-dakr@kernel.org> <20260814230923.1292966-2-dakr@kernel.org>
X-Mailer: git-send-email 2.56.0.212.g129ede20d9-goog
Message-ID: <20261016135439.44716-1-aliceryhl@google.com>
Subject: Re: [PATCH 1/7] rust: drm: rename Ioctl device context to Userspace
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

On Sat, Aug 15, 2026 at 01:08:59AM +0200, Danilo Krummrich wrote:
> The Ioctl DeviceContext typestate represents a device that has been
> registered with userspace at some point. This context is not specific to
> ioctl dispatch; it applies equally to GEM handle callbacks, mmap,
> fdinfo, and any other operation triggered by userspace on a registered
> device.
> 
> Rename it to Userspace to accurately reflect its semantics.
> 
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
