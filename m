Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF7033AAF6F
	for <nova-gpu@lists.linux.dev>; Tue,  8 Sep 2026 08:00:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788854408; cv=pass; b=Ek5Wgf3LSF6PGuI2p494CfL4XSDW6vi6whYKJNAX0GSFkz2DD7ZBpEqyLpmG4TIYqK+sntT1/1zAHfEK7cDVTOhaSJLKfvSVCBNQyPgEjdGo59aXSQJ0QBMItI7KNJVsBoqIzu6GTIJ/9GNZrflLNRnIhX9laEDk8MchXNMbAf4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788854408; c=relaxed/simple;
	bh=guaq+VGBE5xuZsh8TwFyvRdWEV5RQewzlTdQ0HnyLyg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=V7VTc9X9bPnCd84dq8pwZhfU+XI8WZrQiRf0JiykesZwd070P7GVeIR7MyRxiRxoUE01ec7vUYMSoO2rDGFTG9AU3N0AGu6grucaP7pncIIJkMPrRKw150Lvoz1ZZT0XdMFc16o64a7bpAyHI8iY6Nt8wBapQhGyG8AT9HL25l4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GGTntDzx; arc=pass smtp.client-ip=209.85.222.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GGTntDzx"
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-9399daa3c8eso190214885a.1
        for <nova-gpu@lists.linux.dev>; Tue, 08 Sep 2026 01:00:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788854406; cv=none;
        d=google.com; s=arc-20260327;
        b=aZGkmbftgq0UEVi4oi9hIQm+EB+YG6c4/7KuQPnNKChoiDuVTKQN6WJepmpJ7ooa95
         aRPIOHqu4d9Bowwf/QO/vmwvy7Znq9gODikylB7aqu+tFhA8fXnCzhXhjrEyPW/w9v3w
         Q4eK9CtDALMChQcSw4pjVk96R4lNO2ghtefObYWYXUAzmE8Q+C4AREfl8TuKjsy59tpT
         /3zDdtOBrA3u7EIKJnx1uhku0ZnUPv2QuivBuIa7+L904jU72fRc1HBel+yHbpy5a1d/
         hbu5SsgzYBOjP+fIl0fdxReZA/cSr9XwJ8LtUr/tQXQO9jHgIpYeLXveUMrVlYz15rvn
         Wf0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=guaq+VGBE5xuZsh8TwFyvRdWEV5RQewzlTdQ0HnyLyg=;
        fh=QezALCPbt99+MtEbhZBywxVLp6PlR4rgnCkUNKl8lJ4=;
        b=MxHSAQOvS7t3bUXMZEHntGK8GWM42Vsf3oyXwG7TFzMzI3+ReSuK7FXinjtVaRZsxD
         PZX+XD2sOWOXZTqhYwuK/afhDNp3gu3w4G+QgcTcewLXplerZIZTAOOOWmJ6rtr+z1Fn
         uArcmp1y20g8Eb/SM22/oteFAixamiu6Y9R4YBC3XL+G3Gd6RXLnra13YcYCw8PVHF4X
         Dwyb8rvLPnp7RqkN2ZdD2bSaSN/H3iKPmWWtGLw9UVnf/re2WBSA8poPK6M4MUlXuhRV
         wRWo2X5MDsI5boIr50Ug6udzFU6hG2p0Euq/qHEiNCj58WHmzMbVL2MqdcVGigQdfvzl
         4Ohw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788854406; x=1789459206; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=guaq+VGBE5xuZsh8TwFyvRdWEV5RQewzlTdQ0HnyLyg=;
        b=GGTntDzxAkoCKKXUidiZRKPv2K8qHmHG8p6ClGH9Rkudzeoir0zaKbHXayjBmmcTvn
         L5MgXkyhM0f5dFtzPwagDUQ1qqRe3wdAfuUYoTfMZdS78MVBl5Oju43vy+BtALngLM1N
         nTJS0hqODLoFvO/fL44wCv0495j4VII1x7gUAk2wzlHhQoVQILFGuTCCtX3/zOdmuim+
         UerbYR0Qz1ke127NFO+ZJY+/9+mmfoJ80b1DpQww/Q+XEd6M1lbkS6EqUrGeT3AORu1B
         6YtFZXtSQW4uIMfqr+fDLXV5byXquumXcTWMuLWIQWA61no/xHHA/rgnaxQkjUC07WSh
         rKWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788854406; x=1789459206;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=guaq+VGBE5xuZsh8TwFyvRdWEV5RQewzlTdQ0HnyLyg=;
        b=BPYn+UkLaiMAD3phAfgHGXg6FjjHyg27+HC4FiPGOG37WM0rrk9SfuoQWUyC4Lb8yU
         Dy8Q0G2qWA0+W1QjQQVhFUoC1JltHa+//0BnN3RjcogEzIJQ63Ib61bbpLUjqkLd6cQI
         v5Ejk0h/QxPY1fkoeFm/oUda/oCh1M2o9na2Qey9MUCHPzG+YC4SXJvqjLeUZlSjlZWQ
         QLezXAvYcH0uA6JNGDSrXcZv1msNRruLjHh2MXYrdaISFlhMOhjsswEwdoteVpqIBdpJ
         mslXCJO4hrfqSaP9gbbnoSgKca7snRWimrhpTYn/qOyvt6eBMXTYAzBK+TIG9Fi+ojnc
         /OAA==
X-Forwarded-Encrypted: i=1; AKwUvBzm0t3zjv9VdSDlwN2+9CK1CxzFcQS+PHsoKkeiI7UmDWF5aD88YBgHwuVH+9kh1nHZ4YuPcpdBnw==@lists.linux.dev
X-Gm-Message-State: AFuF++nGK3rbyDhIysJq/SR0aVjvtRBZTwvGmvREdrKx3K5ifcgJqB5P
	/icSSiM5nNvyOrVI9hx0mtmEsINCzY75tQR0OJ89PeomYGVB5TJey+b8R6FaGgZLpWtfPILYgsr
	g5CbeTfu7BG5V5oZxLldN2jbRV/vGDt0=
X-Gm-Gg: AYBFou3P3cGVvvsDVvSmxZ+CsXgRfGnE/9HstlW++uSx4LPOVZgRGPdeb7lz9ZIReIb
	y7gTMxoJTSZffVrsU69dtVgNpfUBfOFSxfaErDxun5tYwPYoZsAZepKFOtPyFDZSyuBdwwqhgIE
	GbcQlHVA9bGHNhbeef+9RYGBCmm+wo7PwU/+qVROj7RBIY8O9JgZt/XsVkNU7DvySt5+donQigx
	XySAeAU6pWMDgtzFMyr/KTOUHXNWXDK6Ip2hK4J9wjlIx/3VOz04SL2nEpYgxNg/uHoOJuFU5y7
	unhRY08fDumZJXxUIybLA2jzZL0c67vft/oHapgYHDjwc2KG1KZ1b+Ezs8ZfeHuNwkwjnrCi9Ab
	VTzv9dw8cWKUYncedjei3h+vPIJAYvPEG0PjLnabP
X-Received: by 2002:a05:620a:8386:b0:939:6d22:6fd with SMTP id
 af79cd13be357-939803712c1mr2713471585a.18.1788854405591; Tue, 08 Sep 2026
 01:00:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260828033531.1117754-1-apopple@nvidia.com> <20260828033531.1117754-6-apopple@nvidia.com>
 <DL3WXUPD5JKE.2GZ1CNJH539ID@kernel.org> <DL453EFS03T6.2VGI5TJEQ52QO@kernel.org>
 <apdvTgAp5eGezO5t@nvdebian.thelocal> <DL4QCAZXM8EU.2K8MLAM00VNTX@kernel.org>
 <apioGUDamrCur_oR@nvdebian.thelocal> <DL5MA26KZEF9.3KHKQXZ4JD2G6@kernel.org>
 <DL6HKYRXHNFK.1D9HYNEPH4GCR@garyguo.net> <DL6IQKQDXY7P.1F6PSERSJ64PN@kernel.org>
 <ap-vnh7KFJGJLW1s@nvdebian.thelocal>
In-Reply-To: <ap-vnh7KFJGJLW1s@nvdebian.thelocal>
From: Dave Airlie <airlied@gmail.com>
Date: Tue, 8 Sep 2026 17:59:53 +1000
X-Gm-Features: AcwNN1WfQW84CsExuRlle70Uv_VaeE2kPFpysKqrhKzJ84K5F_EcHs0pQw3o8S4
Message-ID: <CAPM=9ty74336zKWvS0BPVDnsczCPOPg_Lc0VsZnUfe8Yc=F1Yw@mail.gmail.com>
Subject: Re: [PATCH v5 05/11] drm: nova: Add an info ioctl
To: Alistair Popple <apopple@nvidia.com>
Cc: Danilo Krummrich <dakr@kernel.org>, Gary Guo <gary@garyguo.net>, 
	nova-gpu <nova-gpu@lists.linux.dev>, M Henning <mhenning@darkrefraction.com>, 
	Alice Ryhl <aliceryhl@google.com>, Alexandre Courbot <acourbot@nvidia.com>, 
	Benno Lossin <lossin@kernel.org>, Eliot Courtney <ecourtney@nvidia.com>, 
	John Hubbard <jhubbard@nvidia.com>, linux-kernel@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> > already provides it to us.
>
> Yes, I did look into this. Unfortunately the SM version GSP currently reports is
> different from the SM userspace code generation tools need (I have no idea why,
> there appear to be way too many SM versions).

Here's an example:

https://gitlab.freedesktop.org/airlied/mesa/-/commit/2f0724ef6b739c26ebd8b0828c93c51b137d7a9e

Dave.
