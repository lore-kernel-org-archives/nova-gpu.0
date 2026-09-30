Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A39935158AE;
	Wed, 30 Sep 2026 17:58:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790791127; cv=none; b=FQJqocADh/elKfhm6b06Ka9fG0zXZ0q6l59JbX98prPWpZgUuaixwh9OPB80JPzxMOpOHHEIF8mcnDdrRucsaJIACNTDI5J1xLk/SfwOnLZtCKd04cAigGQ2imWIl52IO7237TS18i9fcVVcCmZ43cWlnaI+Y6rXmMRh6JO2hDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790791127; c=relaxed/simple;
	bh=uS4owrEEIDMiSVtxw8FbcjTGd/yYbzX8NT3vPVVgCt0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GQr5sRLjNaOIIzvYZKF48viTt6yridzR7WEUQF+wKUOmyvITgvryR6qNWvHDPZVg2SCYRCQyb1lwFCFcyjK0SLnGrKHXobRm4W0kOdFcQfwEscVfBeD420OPJ3x86NM97zFaQRk82JxVtNXh+67iq87MSzrt3emVKwg+lSXubpE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VC756/Ae; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VC756/Ae"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09FAD1F00898;
	Wed, 30 Sep 2026 17:58:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790791126;
	bh=zwNn2y3jV4rc0hT+ux9F09qPl6al0v5pax50ZzrSbrA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=VC756/AeuwjcofmhFOPHDrHKnNv+cxDRMku60f4UhD0ZCNP37BqpajX5OlSDFzJpn
	 KlUQJLA9EoDA2h77xKeO98l6Xn/moJPChfd0B9h5OjzYTAfsVOQNjpdQYRlTETzChJ
	 uJaBBC+O1y28c9iGwaryZgvQbEqYIk6erPjFbKaZbtcAmbhn2N6VfMBPeV4hqWsyD+
	 +4t1VlDT7Hxfu4F3a8ZZn+h3jBoVFSPNhuPp4182W+M3wNnUpiT3eA/pkUTM+M7U+v
	 KGdgpOjiRHfMvIH9C09xM15WgIkcLiuqIPpbKu07v1NE1BroNNfniRCnDq29zQWi3c
	 EdkzpsLnJ7uYw==
From: Danilo Krummrich <dakr@kernel.org>
To: John Hubbard <jhubbard@nvidia.com>
Cc: Danilo Krummrich <dakr@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	Timur Tabi <ttabi@nvidia.com>,
	Alistair Popple <apopple@nvidia.com>,
	Eliot Courtney <ecourtney@nvidia.com>,
	Zhi Wang <zhiw@nvidia.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	nova-gpu@lists.linux.dev,
	LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] gpu: nova-core: restore the "Probe Nova Core GPU driver" debug print
Date: Wed, 30 Sep 2026 19:58:40 +0200
Message-ID: <20260930175840.2600002-1-dakr@kernel.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260929210749.409380-1-jhubbard@nvidia.com>
References: <20260929210749.409380-1-jhubbard@nvidia.com>
X-Patch-Reply: applied
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Tue, 29 Sep 2026 14:07:49 -0700, John Hubbard wrote:
> [PATCH v2] gpu: nova-core: restore the "Probe Nova Core GPU driver" debug print

Applied, thanks!

  Branch: drm-rust-next
  Tree:   https://gitlab.freedesktop.org/drm/rust/kernel.git

[1/1] gpu: nova-core: restore the "Probe Nova Core GPU driver" debug print
      commit: c9ca2e379463

The patch will appear in the next linux-next integration (typically within 24
hours on weekdays).

The patch is queued up for the upcoming merge window for the next major kernel
release.
