Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E93536F908;
	Tue,  6 Oct 2026 22:19:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791325150; cv=none; b=ueyGLBNL/r7j0Knyo+Eud8OJz5Xs8gTKwip3yXsY2QtuSP0v8SVBa1h7EMEGj9SIu0Rzk2gX+JoJe0+fOhcsxdHMuDINqk4Amq5/09POFGXClZyPkBwpZfXavysH1XuGVhKOuIMcobMVfLSBKWQR6u3FOJXof9X0udyvnUl2Dvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791325150; c=relaxed/simple;
	bh=8BFYpCQBEjNFpUSGUCQmztUfW0VuANnwS9gE1ldxUqk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=D4w6IQAlZIPfrGYKCgAE+JsuYO6uTpp4eSAXpxG4TXQ8+You3krAhwwqw7mmYKuzIhIZ1GED3hHO2PsTKXZlgKDxGNxjYyhB6tYyqhOxAPORzAYs+mIlnuInaM3z1oAhlb9wSISCcAJWP1LIiP+a+zAzbs2zPrjfswJQ9TSoRls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Z/j1WNC1; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Z/j1WNC1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ABA841F0089B;
	Tue,  6 Oct 2026 22:19:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791325149;
	bh=Dsw+Om99HBmxjd0KI/89CLMDxJNPm3Znm2nWLVCGV60=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Z/j1WNC1IyFZkN/FIWqLEnFtpIxtrIOb3ev1tnmwP9R+jHTMFQCahDb5BB6YSmoc0
	 S2/1VF69m2htIe+Zx1OIE+W1B6SIcjB4UJGZ8HL9iaWkCp+4VCEiGFzUga3O0N/UBf
	 Hw3g51IbZ9fSYAWMRn9b9NmaWYn8AV7nnTJaiInB7W3Xk5Tz7cpcBI/43/gbKpbLsv
	 lgAbWBrG+abnb+yUIX+OWNYaEH1Y05DXa54+iyaXdxFhmHSzxIDeiC9vcgcC3UONFN
	 CFDGwhxn5+AxLmJqGVRYlWMI63H2U4WzTyLfLbX8Q67qmmhtgbFoQuGMrlJai3nui9
	 OZ3oc0sKA/mEw==
From: Danilo Krummrich <dakr@kernel.org>
To: Thorsten Blum <blum@kernel.org>
Cc: Danilo Krummrich <dakr@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Alexandre Courbot <acourbot@nvidia.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Eliot Courtney <ecourtney@nvidia.com>,
	Gary Guo <gary@garyguo.net>,
	nova-gpu@lists.linux.dev,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] gpu: nova-core: gsp: use KVVec::zeroed() for payload buffers
Date: Wed,  7 Oct 2026 00:19:02 +0200
Message-ID: <20261006221902.41227-1-dakr@kernel.org>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261006115311.92873-3-blum@kernel.org>
References: <20261006115311.92873-3-blum@kernel.org>
X-Patch-Reply: applied
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Tue,  6 Oct 2026 13:53:06 +0200, Thorsten Blum wrote:
> [PATCH] gpu: nova-core: gsp: use KVVec::zeroed() for payload buffers

Applied, thanks!

  Branch: drm-rust-next
  Tree:   https://gitlab.freedesktop.org/drm/rust/kernel.git

[1/1] gpu: nova-core: gsp: use KVVec::zeroed() for payload buffers
      commit: 6148fb2fc4d3

The patch will appear in the next linux-next integration (typically within 24
hours on weekdays).

The patch is queued up for the upcoming merge window for the next major kernel
release.
