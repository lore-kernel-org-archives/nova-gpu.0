Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9535A31F9A4;
	Wed, 10 Jun 2026 19:03:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781118198; cv=none; b=pdl7gKJIb3Lia2zSdH17fxcgeEu+vsKDs/ACNmmGjw+NBQdJ7u9xhGLdWjvlWxz1rq3jtiOQbIv4xIJVerX3yhq8gKOSDBRFolCBUlLFnXCr78vG+MMJexqG05dcUkR4KzQDQKs+BsfEhrDq7+lLoHDa1p5ZAhIjVRS5lmvhFrw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781118198; c=relaxed/simple;
	bh=xu9nyo3zw0NP9b2IAHAJMgciXTnksGPiyrobArZU334=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EuZ7LCoiEQHd+jLduMKdn95MumXNueMH+GO6yVU6Q2kFHA4Ua2W7s3ig9v4dhHFSTj8+KZDKwIOSwt1duAljGcBhVFKWWm3TCIO1RIrjMPHaXnkJbv8MxW7E367hX/jQAcLAPFw8XJl/oP0fSuk6zY7v5DioE/lJ++j0TFVGsi4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iUloCyA/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iUloCyA/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00FB91F00893;
	Wed, 10 Jun 2026 19:03:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781118197;
	bh=WvwQbLxB0UHHe8ux2/5GenrCNn5hMTEqQMNf4b3IkF4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=iUloCyA/kbcdbXLVznfNG1X8sHqsKTMYdTOaK7yuObQft4WQ9yLhu7fUKmwmoTuks
	 FgwgsEgwBHlj+cs8dtauTTS+IxgQrTO69eLRfLplGmOGOXAMYVLgYeqxn+ddDRwCj/
	 DmJNQK0/4WIbKW+KMeDSFbu48JYzCP5xmSRlG48WQ1CchSODjFHmK9CiVDcgV+APNc
	 8JjMtJZI/EsvhVMK7kVBazxirHkGmDXnTDuXuYjaISaVlAbFnkC6je4v6DSwgQVoIt
	 2UmEytTm02YWEMcDNran2C4DoD+Dy54Th1jTdt0vnXdPiD1PGms/+mFrg2GFyPp/Jb
	 ADvX1Do0jBWGA==
From: Danilo Krummrich <dakr@kernel.org>
To: Antonin Malzieu Ridolfi <dev@nanonej.com>
Cc: Danilo Krummrich <dakr@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	Alice Ryhl <aliceryhl@google.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	nova-gpu@lists.linux.dev,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Daniel Almeida <daniel.almeida@collabora.com>
Subject: Re: [PATCH v2] gpu: nova-core: gsp: Move gsp register definition into gsp module
Date: Wed, 10 Jun 2026 21:03:11 +0200
Message-ID: <20260610190311.52106-1-dakr@kernel.org>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260607140949.152575-1-dev@nanonej.com>
References: <20260607140949.152575-1-dev@nanonej.com>
X-Patch-Reply: applied
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Sun, 07 Jun 2026 14:10:31 +0000, Antonin Malzieu Ridolfi wrote:
> [PATCH v2] gpu: nova-core: gsp: Move gsp register definition into gsp module

Applied, thanks!

  Branch: drm-rust-next
  Tree:   https://gitlab.freedesktop.org/drm/rust/kernel.git

[1/1] gpu: nova-core: gsp: Move gsp register definition into gsp module
      commit: 3e4bac7b8ca7

The patch will appear in the next linux-next integration (typically within 24
hours on weekdays).

The patch is queued up for the upcoming merge window for the next major kernel
release.
