Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0ECB4FB9C0;
	Wed, 16 Sep 2026 11:10:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789557040; cv=none; b=BjtNqaPsLAyZztQFwy5EPLdOWonLqBTwDJHb1aO9y4wByzth6DABWxpr9RA/O9NmHM/hhlM19DMkGuvi2IoqShgVEyZMoG+MrIFCYVX9IDHSDcetKZ3d5/msBon/pGM3aEwNJpt/67Nm1yKAk1Tyt1RBPv8rriA8NeoTKwDhb8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789557040; c=relaxed/simple;
	bh=wW3W6+hAl9GsjtNdNsfu918xffWkn3w6EXo/LVx7tvI=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=amOh0fWudjdOHle9mPLR1r+kxvmatxOmoBrb0THm1yFb4/hbPXc3RL7c1wNZsJjRSciDYAk51+SEW86y8ZbIa48wJIbhKM9cg6Z4blRM+a4MbeOo8dP65X2rYdF5s8VkUbw/HrjNjfAX6GCDl/4SdCGZjfLmixX1HdEzwy+kUyY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FO21eFqG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FO21eFqG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78FA51F000FF;
	Wed, 16 Sep 2026 11:10:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789557011;
	bh=9ZvfdkSPoJ0l4uV8de9Ug+Y8janX4FhZcsX350fS7OM=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To;
	b=FO21eFqGECoEb72/c8gpDPsVELRWV8gykNW0BaBQJMS/mUmKcy0xMgxyomceyUxC5
	 9BOBmsi3harc/CBDyVparvUFIWwNKGxlKZ6H9E5Cc8uTzm+DGnTi0wHBz1ggqcGLZO
	 km1RLtbxKKhhDnQ6Wnnr6NCSUgQ6zRakbP8MpRlx2ZUcvx2uUUTE8JPZssTTPFJG/4
	 dbeR32xPj4onuSnYsXJ6OEU9MV2OKM7KNvcE7QP6wnZksjGR2M84B8O7hMgDRNn1Ub
	 H1VV2dj3ysrex1LU5kHHBLZWk64M7AvZCkQ/Q9/1EjK8AR7f0HQhG27hQVBpyacggO
	 dUdiN0tmU4CXg==
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 16 Sep 2026 13:10:03 +0200
Message-Id: <DLGP0I9486HX.3TXIAX83G8TD5@kernel.org>
Subject: Re: [PATCH 00/14] Add Rust PCI SR-IOV support
Cc: <acourbot@nvidia.com>, <yishaih@nvidia.com>, <skolothumtho@nvidia.com>,
 <kevin.tian@intel.com>, <simona@ffwll.ch>, <ojeda@kernel.org>,
 <alex.gaynor@gmail.com>, <boqun.feng@gmail.com>, <gary@garyguo.net>,
 <bjorn3_gh@protonmail.com>, <lossin@kernel.org>, <a.hindborg@kernel.org>,
 <aliceryhl@google.com>, <tmgross@umich.edu>, <jhubbard@nvidia.com>,
 <ecourtney@nvidia.com>, <cjia@nvidia.com>, <smitra@nvidia.com>,
 <kjaju@nvidia.com>, <alkumar@nvidia.com>, <ankita@nvidia.com>,
 <aniketa@nvidia.com>, <kwankhede@nvidia.com>, <targupta@nvidia.com>,
 <nova-gpu@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>, <zhiwang@kernel.org>
To: "Zhi Wang" <zhiw@nvidia.com>, <alex@shazbot.org>, <jgg@nvidia.com>,
 <airlied@gmail.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260915205659.76841-1-zhiw@nvidia.com>
In-Reply-To: <20260915205659.76841-1-zhiw@nvidia.com>

On Tue Sep 15, 2026 at 10:56 PM CEST, Zhi Wang wrote:
> Rust PCI drivers need to enable and disable SR-IOV and share selected
> PF-owned functionality with their VF drivers. The shared data must remain
> valid while a VF driver is bound, including when the VF driver is in C.
>
> This series builds on Peter Colberg's Rust PCI SR-IOV v3 series [1],
> extending it with typed PF registration data and C FFI support. The
> registration design follows Danilo Krummrich's Rust vGPU/VFIO PoC [2].
> As the discussion on Rust/VFIO support is still ongoing [3], this series
> supports both C and Rust sample VF drivers.

[...]

> [1] https://lore.kernel.org/rust-for-linux/20260303-rust-pci-sriov-v3-0-4=
443c35f0c88@redhat.com/
> [2] https://lore.kernel.org/nova-gpu/DLCRZLO06SIO.LS7TWQXIPZSQ@kernel.org=
/
> [3] https://lore.kernel.org/nova-gpu/20260914121217.70fa0d93@shazbot.org/
>
>  drivers/pci/iov.c                        | 103 ++++++-
>  drivers/pci/pci-driver.c                 |   3 +-
>  drivers/pci/pci.h                        |   2 +
>  include/linux/pci.h                      |  44 +++
>  include/linux/rust_ffi.h                 |  88 ++++++
>  rust/kernel/interop/ffi.rs               | 252 ++++++++++++++++
>  rust/kernel/pci.rs                       | 126 ++++++++
>  rust/kernel/pci/sriov.rs                 | 355 +++++++++++++++++++++++
>  rust/macros/ffi_vtable.rs                | 148 ++++++++++
>  rust/macros/lib.rs                       |  90 ++++++

Thanks for all the effort, Zhi! It is good to have a reference to see how t=
his
turns out.

Unfortunately, this raises the same concerns I already shared in the other
thread in [2], plus additional ones:

  (1) This FFI layer is already more code than would be needed to abstract =
the
      vfio-pci driver API surface in Rust. In addition, it is also much mor=
e
      complex and error prone.

  (2) By creating a generic FFI layer to connect PF and VF drivers (which a=
re
      technically the same driver project), we incentivise writing cross
      language drivers.

      When the panthor DRM driver was considering to (re-)write parts in Ru=
st I
      very much objected to this, as it would have created an arbitrary FFI
      boundary within DRM (which for obvious reasons would be a maintainanc=
e
      nightmare).

      Now, this is not exactly the same, as it is not an arbitrary FFI boun=
dary;
      it is well defined. But, it is still a workaround for a single driver
      project being split up in a Rust and in a C portion.

      The FFI surface is best kept at the subsystem level abstracting the d=
river
      facing APIs, which provides a defined and comparatively stable API
      surface.

For those reasons I don't want to add this to the PCI (Rust and C) core cod=
e,
i.e. I don't want to support a generic FFI layer between PF and VF drivers.

I really hope that we can find a way forward not having to end up doing thi=
s;
but if we really have to, we should stick to a nova project internal FFI la=
yer
for this.

Thanks,
Danilo
