Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C80DE21CA0D;
	Tue,  2 Jun 2026 21:07:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780434427; cv=none; b=qXQCapTC4Ephc3hBejdPvJ2Sfa0LDE6jH0CiSiqfaPsihKw9+SJNaaMg/4jiXfOvCA/P3ACQjs9MSlV2fh68EYhh+SvZ5AAI3305WfGFc+GHBaML35FKr5Cc4H9qRDPXu5C5xfK0+Vsma4bD2M0S/Vz4tvm+LvJeYVGSncUDFm8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780434427; c=relaxed/simple;
	bh=XNQ6l1x2V2wqcKAAOIcZo6YVCluqwbkdrlbhNesSKF8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cXnmX5jfl3CMiImbZRIGoPnY7h+Yph2c2MoENkRjgE4DALPHhHN1cD+x5yxXYoj72pvd0a7oLAH0JPpD/l2JYMW3wGhpMMuVUZN1YbP+/IJUw+QeYbhXWcj1TmefrbVR3JWJEXl+lXrDCQrfx1CJFo8cVhUPh/7+tOv/MskBeX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=h4l3MyzV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="h4l3MyzV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E6211F00893;
	Tue,  2 Jun 2026 21:07:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780434426;
	bh=DX7aQVZtVpsdM/RCECISKbiWk2U1XLyBOjRx65HmhIc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=h4l3MyzVzZPPdBXqFarUf5KwwJu3EUiM6Ue2kf/367heW/5is0XWYQSNEeRy6h5Rh
	 wEOsE/KBezpouAP3m9sG01b913V/3jzSzDESGF8lX51wDBeB/tr9vXeh6Pip2ouxo2
	 wZUkjeYKlk/0aOpDjz+sK5dcctZaPwxmnVDEm4sQXmXmrzPCjRtxwf4CErTzMcaTsY
	 J6twA1BBssw4l+dxUrzNY+PGXgXFqSh7vMz7hM4CEXkeLKXprsWzuUBjTTbaDTmbqh
	 LGKVVOjMm3Vhr2EmeOZTP9j2h/xtZZ0p9c9oclVgKba+Hr/gxnjftcYAGpytaCbvf2
	 LvwarXhlsYVqw==
From: Danilo Krummrich <dakr@kernel.org>
To: Lyude Paul <lyude@redhat.com>
Cc: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	Gary Guo <gary@garyguo.net>,
	Miguel Ojeda <ojeda@kernel.org>,
	Simona Vetter <simona@ffwll.ch>,
	Alice Ryhl <aliceryhl@google.com>,
	Nova-gpu@lists.linux.dev,
	Shankari Anand <shankari.ak0208@gmail.com>,
	David Airlie <airlied@gmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Asahi Lina <lina+kernel@asahilina.net>,
	"Mukesh Kumar Chaurasiya (IBM)" <mkchauras@gmail.com>,
	Daniel Almeida <daniel.almeida@collabora.com>
Subject: Re: [PATCH v6 0/3] Introduce DeviceContext
Date: Tue,  2 Jun 2026 23:07:01 +0200
Message-ID: <20260602210701.1705071-1-dakr@kernel.org>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260507220044.3204919-1-lyude@redhat.com>
References: <20260507220044.3204919-1-lyude@redhat.com>
X-Patch-Reply: applied
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Thu,  7 May 2026 17:59:18 -0400, Lyude Paul wrote:
> [PATCH v6 0/3] Introduce DeviceContext

Applied, thanks!

  Branch: drm-rust-next
  Tree:   https://gitlab.freedesktop.org/drm/rust/kernel.git

[1/3] rust/drm: Introduce DeviceContext
      commit: 571d4242c466
[2/3] rust/drm/gem: Add DriverAllocImpl type alias
      commit: 43a5d04a743b
[3/3] rust/drm/gem: Use DeviceContext with GEM objects
      commit: 0023a1e8d01a

The patches will appear in the next linux-next integration (typically within 24
hours on weekdays).

The patches are queued up for the upcoming merge window for the next major
kernel release.
