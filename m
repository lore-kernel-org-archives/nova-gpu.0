Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B176C37205D;
	Sun, 27 Sep 2026 12:17:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790511466; cv=none; b=MQOdWoxYjVuCV4sgKc/wVUMyTqut4zMlihmDGCMoHR0chsMWA9VBjqjoSUnXr9soyepUiv1CQU0I4iKouORkEcRyXi2B2+mest0EQkf/YBDYjApmSN9BpKSEWz0wp2/BmO951DSf6t+qsBDpS5JnXWzxEE1jSkubPP6mJwLBsg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790511466; c=relaxed/simple;
	bh=PTRkkTXVxGJMzXmJlF9dD6sdt47tb5xMSdRJShSdzSg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mTQ30hZHKX45OBr+AaFBfGlIf68P1j9oSa1W2jG6e+PVc4ewKoyWMsgJEPU0OrSrufwM/JiPs/sT7rILfAQRPuocqI60y2TDK/U/vnngcs6v+roOoaqAYUuMECOaUloky7HN6ha7yPjRdHlONk8aWMthXZJ/d/BW7NsQtMgB69A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MLk5Bag7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MLk5Bag7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4DB61F000FF;
	Sun, 27 Sep 2026 12:17:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790511465;
	bh=xqUE0FvGfdn5OiuSuPy19yIzKGKDP88UyxFWANSnq/s=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=MLk5Bag7wHxI3dJM0t9PJz4F2e+NVdZV19mbINhhK/kYuSHzH8BZpwDk/Y5tIER/S
	 m1HVieCPTX9A2AKHOD8e4jww1HoI6EZyrYi322EcvBOd27x3rnjVoIih0akEhB+7mK
	 ZM6+riKOQOfyiqOdw/0T/lSGmJTZrOW/F2dh1mJgfdDEw2zjhbXW5HRp8hWReRRbaM
	 qYo+NsR0jM2hxy8HtMPVPne+DHMoaGlXXwVjD0zSRKV8H95r0h19CZAIyqOfKrAwod
	 h/BnSAGuqayDQP1P4fDQWbZpQrjbYKDtW/sPbtJGlE9DgLP3kWw51v5NHGdVXSCOSM
	 g7qh83mw1jupw==
From: Danilo Krummrich <dakr@kernel.org>
To: Alistair Popple <apopple@nvidia.com>
Cc: rust-for-linux@vger.kernel.org,
	nova-gpu <nova-gpu@lists.linux.dev>,
	M Henning <mhenning@darkrefraction.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	David Airlie <airlied@gmail.com>,
	Alexandre Courbot <acourbot@nvidia.com>,
	Benno Lossin <lossin@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	Eliot Courtney <ecourtney@nvidia.com>,
	John Hubbard <jhubbard@nvidia.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v6 00/13] gpu: nova: Export parameters from nova-core to nova-drm
Date: Sun, 27 Sep 2026 14:17:36 +0200
Message-ID: <20260927121736.1186364-1-dakr@kernel.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260909064506.910162-1-apopple@nvidia.com>
References: <20260909064506.910162-1-apopple@nvidia.com>
X-Patch-Reply: applied
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Wed,  9 Sep 2026 16:44:53 +1000, Alistair Popple wrote:
> [PATCH v6 00/13] gpu: nova: Export parameters from nova-core to nova-drm

Applied, thanks!

  Branch: drm-rust-next
  Tree:   https://gitlab.freedesktop.org/drm/rust/kernel.git

[1/13] rust: auxiliary: let registration_data_with() closures return covariant sub-fields
      commit: 4075acc9d489
[2/13] gpu: nova-core: Add public driver API to nova-core
      commit: 6e70b1719991

      [ Rebase and use pin_chain() for Gpu::run_selftests(). - Danilo ]

[3/13] drm: nova: Add DRM registration data
      commit: ecedc604e0aa
[4/13] drm: nova: Add GPU architecture enum to nova-drm UAPI
      commit: 342aaa7bb3cc
[5/13] drm: nova: Add chipid enum to nova-drm UAPI
      commit: a1678ed1f8a3
[6/13] rust: uaccess: add UserSliceWriter::write_truncated()
      commit: b40f5ed85c5f

      [ Inline write_slice_partial() and use it to simplify write_truncated().
        - Danilo ]

[7/13] drm: nova: Add an info ioctl
      commit: ce6e59897ba5

      [ Avoid 'as' casts (add From<Chipset> for u32, From<Architecture> for
        u32 and use IntoSafeCast, IntoSafeCastArch); improve / simplify a few
        comments. - Danilo ]

[8/13] drm: nova: Add usable VRAM size to GPU info
      commit: d9886a1a06cd
[9/13] drm: nova: Use nova-core to read VRAM_BAR_SIZE parameter
      commit: 7edc491f6fca
[10/13] drm: nova: Expose a render node
      commit: 843bb3ccde8e
[11/13] drm: nova: Report GPU name in GPU info
      commit: 391cc215d22c

      [ Use ..pin_init::zeroed() instead of ..default::Default(). - Danilo ]

[12/13] drm: nova: Report GPU short name in GPU info
      commit: e6d9c5b08c23
[13/13] drm: nova: Report GPU GID in GPU info
      commit: 10a6623a24a8

The patches will appear in the next linux-next integration (typically within 24
hours on weekdays).

The patches are queued up for the upcoming merge window for the next major
kernel release.
