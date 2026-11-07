Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794018891;
	b=NQ9XOGVhLvu+Fn4jqL/onFym0H9Da+Yl0WTBzWkxPMBFEJs+lZ+eDOl5c/eFOBMBiSGE
	 ymwfRMi4WpH+/B9FndvWHYCDJZr9fEBrZFaiPUJhXbt5Nmqei6Psl49YzV3oRYddsv05/
	 /GwAvE4XIVEdOEfQph47FNv2UPvNpIH/sVVN0QLImptdwG/2KBrgfyFpiA37euWpfTUaH
	 LHkt7Bw2r2Uj9vcd6afMAjCKz2DHf8G2cpjOouWPeAC8h5udmrOv9wETfwcWk2QCuGbJL
	 hYrFy/fcNZhzPIiV7sSF3KvcrSMRE9nJSx3Cav8QsGiPyg6NWNtUmG7cH31Qcsbw2+Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794018891;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=XC6Bvvo3rDeCF2AMJIdxcZr+GCCpYCyUCbAuum48PMA=;
	b=xgu0mKmemK5iDl1ghsgRpGQjwzXCMKz9jH4lFB+dUi0FXyrWpyLuTuCB637Pw5Nz7cmi
	 dL5x/gSbuWqgg8yB7y9TAv6EUlJ+Ek3InxHTmRQyEXbNFnzdf+YkMKE5SNpn8jzI+yn4i
	 j+gM0q/dXkal0AQBa/91s2nBiAt0rIVXLZSlTyYn7C+mIzTKi8THXjh/1X9nMkNgWerYa
	 qffKOmIffJw985FEG5OOH8+k1w9AuacetXsWyLHhxkTNiQxnHFyiqXxd7rnHPJEgWV2+F
	 BPL8WRHJRZsueK5VogytujMOPik3L5QRJVQ8CWZhaw3gkYLWRFkS8bhRCufQfxcutqw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UGCKO3mA;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C400606A326
	for <nova-gpu@lists.linux.dev>; Sat,  7 Nov 2026 02:34:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UGCKO3mA
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6C241F008A2;
	Sat,  7 Nov 2026 02:34:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794018890;
	bh=XC6Bvvo3rDeCF2AMJIdxcZr+GCCpYCyUCbAuum48PMA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=UGCKO3mAWn28gtgt6u8YHXOugGrv6ig7EdzoOSnQKZ+fXkfgdZA3LbXMG0unQtNeH
	 f7I+DLqXbvx+zQYOtYAxlefnoDPMpScJaTBnTZ9X5xXhWXjuC3gC4FzSeLc/Ht2GG2
	 CqgyYWQX10o66l/neVVHkeZWoa0jkKVjzt4zjESO2G0OXWGE5bhjXNBYLCaPS6sqS1
	 jKYiDbJZn2cMZBi0v2JINKBUS2e5oVvZtNdqNXqiAnfrWENBu+ndeQpRdfpBCfv/Pm
	 GuZjggZMoFM52K2R1wxmy7yGkbqD0zxMc6/JUnVW6laWagi1Xe+f/vPNF0KNwqZFhf
	 plZbe+Sk38enA==
Message-ID: <sashiko-outbox-202513@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 7/7] rust: drm: make Driver::File
 lifetime-parameterized
Reply-To: sashiko-reviews@lists.linux.dev
To: "Danilo Krummrich" <dakr@kernel.org>, aliceryhl@google.com, acourbot@nvidia.com, daniel.almeida@collabora.com, ojeda@kernel.org, boqun@kernel.org, gary@garyguo.net, bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org, tmgross@umich.edu, tamird@kernel.org, work@onurozkan.dev, brauner@kernel.org, lyude@redhat.com, j@jananu.net, alvin.sun@linux.dev, deborah.brouwer@collabora.com, laura.nao@collabora.com, beata.michalska@arm.com
Cc: nova-gpu@lists.linux.dev, dri-devel@lists.freedesktop.org
In-Reply-To: <20261107021427.2105374-8-dakr@kernel.org>
References: <20261107021427.2105374-1-dakr@kernel.org>
 <20261107021427.2105374-8-dakr@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 07 Nov 2026 02:34:49 +0000
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Post: <mailto:nova-gpu@lists.linux.dev>
List-Help: <mailto:nova-gpu+help@lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
List-Owner: <mailto:nova-gpu+owner@lists.linux.dev>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Medium] rust: drm: missing Send + Sync bounds on Driver::File and
  DriverFile
--

commit 229740f5d6f5f9093208d976d2ea98edc170b6f8
Author: Danilo Krummrich <dakr@kernel.org>

rust: drm: make Driver::File lifetime-parameterized

This commit lifetime-parameterizes Driver::File and DriverFile so per-file
driver data can borrow from RegistrationData, and drops open file data
before registration teardown completes.

> diff --git a/rust/kernel/drm/driver.rs b/rust/kernel/drm/driver.rs
> index f6db91e81e794..92055c4f9e00c 100644
> --- a/rust/kernel/drm/driver.rs
> +++ b/rust/kernel/drm/driver.rs
[ ... ]
> @@ -120,8 +132,14 @@ pub trait Driver {
>      /// The type used to manage memory for this driver.
>      type Object: AllocImpl;
> =20
> -    /// The type used to represent a DRM File (client)
> -    type File: drm::file::DriverFile;
> +    /// The type used to represent a DRM File (client).
> +    ///
> +    /// File data may borrow from [`RegistrationData`](Driver::Registrat=
ionData). File data is
> +    /// guaranteed to be dropped before registration data, either when t=
he file is closed or
> +    /// when the device is unregistered, whichever comes first.
> +    ///
> +    /// Drivers implement [`DriverFile`](drm::file::DriverFile) for thei=
r file data type.
> +    type File<'a>: 'a;
> =20
>      /// The bus device type of the parent device that the DRM device is =
associated with.
>      type ParentDevice<Ctx: device::DeviceContext>: device::AsBusDevice<C=
tx>;
[ ... ]
> diff --git a/rust/kernel/drm/file.rs b/rust/kernel/drm/file.rs
> index bd5e4ca2977fd..2dd0e61718fbd 100644
> --- a/rust/kernel/drm/file.rs
> +++ b/rust/kernel/drm/file.rs
> @@ -8,36 +8,66 @@
[ ... ]
>  /// Trait that must be implemented by DRM drivers to represent a DRM Fil=
e (a client instance).
> -pub trait DriverFile {
> +///
> +/// The lifetime `'a` allows the file data to borrow from
> +/// [`RegistrationData`](drm::Driver::RegistrationData).
> +pub trait DriverFile<'a>: Sized {
>      /// The parent `Driver` implementation for this `DriverFile`.
>      type Driver: drm::Driver;
[ ... ]
> @@ -45,60 +75,110 @@ pub(super) fn as_raw(&self) -> *mut bindings::drm_fi=
le {
>          self.0.get()
>      }
> =20
[ ... ]
> +    /// Access the driver file data through a closure.
> +    ///
> +    /// The closure receives a pinned reference to the file data.
> +    ///
> +    /// The outer reference carries the `&self` lifetime while the inner=
 type carries the HRTB
> +    /// lifetime `'a`, implying `'a` outlives `&self`. This allows the c=
losure to coerce covariant
> +    /// sub-fields (e.g. `&'a T` to the caller's lifetime) and return th=
em directly in `R`.
> +    #[inline]
> +    pub fn inner_with<'this, R, F>(&'this self, f: F) -> R
> +    where
> +        F: for<'a> FnOnce(Pin<&'this D::File<'a>>) -> R,
> +    {
> +        // SAFETY: By the type invariants, `self.as_raw()` points to a v=
alid `drm_file`.
> +        let ptr: *const FileData<_> =3D unsafe { (*self.as_raw()).driver=
_priv.cast_const().cast() };
> +
> +        // SAFETY:
> +        // - The type invariants keep this file's pinned `FileData` allo=
cation valid for `'this`.
> +        // - The `data` field is structurally pinned.
> +        // - The HRTB `for<'a>` prevents the caller from choosing a conc=
rete lifetime, so shortening
> +        //   is sound regardless of variance.
> +        let data: Pin<&'this D::File<'this>> =3D unsafe { Pin::new_unche=
cked(&(*ptr).data) };
> +        f(data)
> +    }

[Severity: Medium]
Should Driver::File<'a> and DriverFile<'a> require Send + Sync, like
Driver::Data and Driver::RegistrationData<'a>?

Without those bounds, a driver can store non-Sync or non-Send types such
as Cell or RefCell in its per-file data in safe Rust.  Multiple threads
sharing a file descriptor can invoke ioctls or GEM callbacks concurrently
on the same struct drm_file and obtain simultaneous shared references to
D::File<'_> through File::inner_with() (requiring Sync), while
File::postclose_callback() or Registration::drop_file_data() can drop the
FileData allocation on a different thread than the one that opened the
file (requiring Send), causing a data race.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261107021427.2105=
374-1-dakr@kernel.org?part=3D7
