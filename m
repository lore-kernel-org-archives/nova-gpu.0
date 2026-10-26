Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792983421;
	b=eZUSVLiK8YBTqeHGSZ8YfoGZkKHyCFLUkJHQLg6ai7FnwmaB0NKvfuJ10mdtbM89zFny
	 DBSH3I1JQ/yru5/tZAIF9u8Q6625DUphcZZ5zS8ipp1MLcSG+D3FS/iE0oArrfTlEuIeE
	 LpiQUZjxuElYRtWwmhWqNcuEmRemy9irSQD/JxNZvjMf3D8r1gQuFs8z7u/CTLVITssKL
	 07YgC+VJq1M675To9dbfrIAQ0X7Es5BbJOt9l/lS8L7Oax8zeLaRz7Kd4uDSNprsPWyfq
	 99y7i/8DPSFWvEde7IH0Rf0sXQ6dZkzriQsYtDAOFgwnzstv9hrAYOELxhTMEkvm24w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792983421;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=G5dca8Pm0XxwJIbXQhbbY5lvo3b9a+G0sVLAejXba+0=;
	b=mg3fUXca4BQsexKhZLapSWfv677ZUh+wRY/3JuRt+KogbGityFjRtopUYBiaJYbvK7YX
	 3p5jMK/pSYpT48VUYIOlKJmlg2+qaukLUSbUbT/rNMo/01OjHFRnrBDSa/zDM3wMNae52
	 HPO8Icag85HBpij8TwoJGN69XEa9VlUgdr6Nldq8RQtd5sbo/7+dcnS/ktojXydmInDrj
	 VS+pBV243/LmIb8v8A5MHUskWTxJzDsnyq3vvBJjTQ3Pvztin86Bmiwyc0ySsoAUZVWZ3
	 5RNkNKYJXPBZb+lr9S0z+JF3YodRKXePu05EZcYoj5f/Z2idfpIEHS0067Ueai0v+5Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GPeyXagy;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9549F606A31D;
	Mon, 26 Oct 2026 02:57:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GPeyXagy
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1792983420;
	b=CDQkHZRCanvcRUHwPGIQHlgnbArSVYQmhsDyzMBbU1PMQvDJdd6A1IBB7V2Dprz3JNEz
	 Yzn9Wo7RW0D63v7J8xU3tFk77CQuIglqz0xDAlfLv9QuxNxEJtHUIg6X3eIvtCcfWhEun
	 1khy5LH6qVgoc5xyJYaVYtFoNIv6kIWWdWoEXGF2CkT6a4rSEyRaYI7cG9BtDOmggglfj
	 qFTqQYXr9ZzDBmlIQwGQ0pifUtz/xXSPHkPitmMvyaA6okWmCydmqoNqH/MdtWgBS/d7O
	 mlTPiJIvvgrB+ZNsabQ+5j17sUd/6Unrr+LXwbtkG7yb/HFvi04T+AJePqQ7l3cQjlQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1792983420;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=G5dca8Pm0XxwJIbXQhbbY5lvo3b9a+G0sVLAejXba+0=;
	b=bnuff+BPvI9gvQbTCK2k90r97uYNXHBegzsjBpi7vCt1Jz0OXgDSw62imNgQKLsqd0n9
	 3pshlc3tbk/JwzbXTXzF8QYq4qFWYEYmNf96br35ESHEpIKLaRHeCZVfASq94hjJXyYTu
	 CDN7zR7MVV5RuR/57xwXAEWrwGVVkEtB96XK1Ym95og6wRDkkTnU+nybC17DAYt4WZRow
	 /QOW5bxoI/0WARvGNgRghb7MkSFhFEWIInBWjXbxoO+0c8u83568T3M3dXEXovA6Tp2vA
	 7T6TPy8QnfgQS9PO5OeG4Gd6NBHIGvqhM0Ea9KQKLuZpCtkWdapiq3Ke5tNJgKmNt7g==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 3B8B21F01828;
	Mon, 26 Oct 2026 02:56:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792983420;
	bh=G5dca8Pm0XxwJIbXQhbbY5lvo3b9a+G0sVLAejXba+0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=GPeyXagyYH/I0z5IJFLOEu4fZshQ0+uc3MPkYycBh3yfD85oQDm4uHPbRc+SW56C4
	 egOV6koEYKqbYFLspXt3Lf+MqgqC8ZeLJDqgnOijRwylBJJklVq5EZbTuzmc4fk2vQ
	 4bN/DYmTDj4/02Nv6skLSkgmJJFNnPuA3BjNk0B74a+AkjsRqfwn8RGAyXJwmmkgTP
	 gZzkzAP9dQXpUwe8UhcZ7/JogzlPwfpNPlYCp37+cBLvsTJ4w0j7T+UhxQV/awDCFM
	 FQRSFtYsiUw0g4pUl50K3tIvbwOyePuV88+aGFdUI5SGQygVqFK+HyBFlC1/9oo4Db
	 mLR+MBOfJc/dg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id A9FA744BD1;
	Mon, 26 Oct 2026 02:56:58 +0000 (UTC)
From: Dave Airlie via B4 Relay <devnull+airlied.redhat.com@kernel.org>
Date: Mon, 26 Oct 2026 12:56:49 +1000
Subject: [PATCH 2/2] gpu: nova-core: add support for GPU timer block.
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Post: <mailto:nova-gpu@lists.linux.dev>
List-Help: <mailto:nova-gpu+help@lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
List-Owner: <mailto:nova-gpu+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261026-drm-rust-next-v1-2-14a4ae469175@redhat.com>
References: <20261026-drm-rust-next-v1-0-14a4ae469175@redhat.com>
In-Reply-To: <20261026-drm-rust-next-v1-0-14a4ae469175@redhat.com>
To: Andreas Hindborg <a.hindborg@kernel.org>, Boqun Feng <boqun@kernel.org>, 
 FUJITA Tomonori <fujita.tomonori@gmail.com>, Lyude Paul <lyude@redhat.com>, 
 Gary Guo <gary@garyguo.net>, Danilo Krummrich <dakr@kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>
Cc: rust-for-linux@vger.kernel.org, nova-gpu@lists.linux.dev, 
 Dave Airlie <airlied@redhat.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=9458; i=airlied@redhat.com;
 h=from:subject:message-id;
 bh=LUtKy83dMr/kiYBAcP65Kw2wH/XzzWo5w0X5nCQocPw=;
 b=owEBbQKS/ZANAwAKAQx081l5xIa+AcsmYgBq3sF5RGeC2DL/pTvaSu/DgFF+e8IjW3vM7BJwI
 FfIYJc1dZuJAjMEAAEKAB0WIQQQptkdobBb0p9t66wMdPNZecSGvgUCat7BeQAKCRAMdPNZecSG
 vuK0D/0YRrzdULKJvzugski2vng/+7UNI7E4xvKIOZ1NhBWKu3+RMXJYR2vMEaU1J+j+nfyx2Xv
 XMRJkXEPaso+8ht9SUCZE7yMIHSL9tmJEyebwEGdyA0XAUbxLHM25YolRnDcC1ypaxyZWVqb5CJ
 7z6De1hmmxxPy+DQAvYq3FMdJkx6uyZYDqc8YHUj94PbtE+WIUx6I4wPu/LKAViW5tPNffjizWU
 bwYmmUvUbPuJ7xY2YnqzL6m8ny/dYFEDigQWd0Azuo+yMfrmhdbkYqUHm74M6w5Li8fF0EXRlGt
 5RLSkcfQgIOWbSN9L1GZkNJ4vu9v7o18Lhw8O5X/rgQ7PAZFJosh55YLhUNfVpkgAOz5gE/q+BB
 RhcQt4hR01vRKgx76ly2XJ8+LlOcZH06dBI7uuD9jp93a/rHkG4pgOvCekvuqC4e+5xK/aUZvo1
 Lqno4TIdQCAGzgGChzK0yswiXvosj6wCsk0jkpWDAtQ8JHB0p5hp4zOXwyRftzAW94Q9uBarRlL
 6polnL4TDVXN9S9gni0ZSaSUBt4iV7+0vB/Rzua75PCW23ZExLGcEJA7xitzSFGkvjKRm+T30ky
 iZ6juJ3KXXC9wiSseKnBOQgoAqyVw4RyO32JOBmQmacBNLTwJXnEhcms1yRY+5LOGW2x8p8RZGN
 hEXyhN2Qcd8TpfQ==
X-Developer-Key: i=airlied@redhat.com; a=openpgp;
 fpr=10A6D91DA1B05BD29F6DEBAC0C74F35979C486BE
X-Endpoint-Received: by B4 Relay for airlied@redhat.com/default with
 auth_id=1321
X-Original-From: Dave Airlie <airlied@redhat.com>
Reply-To: airlied@redhat.com
Content-Transfer-Encoding: 7bit

From: Dave Airlie <airlied@redhat.com>

This is needed to calculate the system timer offset that is passed
to GSP init.

2 HALs exist:

a) tu102 is the gv100 path from open-gpu, the priv level is checked
and the cpu time is written to the gpu timer. no offset is used.
b) gh100 is the gh100 path from open-gpu, where the secure system
timer is read, the offset is calculated and on everything after
GH100 the offset gets written to secure registers, and also
sent to GSP.

Signed-off-by: Dave Airlie <airlied@redhat.com>
---
 drivers/gpu/nova-core/gpu.rs             |  5 +++
 drivers/gpu/nova-core/nova_core.rs       |  1 +
 drivers/gpu/nova-core/regs.rs            | 40 +++++++++++++++++++++
 drivers/gpu/nova-core/timer.rs           | 37 +++++++++++++++++++
 drivers/gpu/nova-core/timer/hal.rs       | 32 +++++++++++++++++
 drivers/gpu/nova-core/timer/hal/gh100.rs | 61 ++++++++++++++++++++++++++++++++
 drivers/gpu/nova-core/timer/hal/tu102.rs | 55 ++++++++++++++++++++++++++++
 7 files changed, 231 insertions(+)

diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
index 4e59072cab50..85ff4a98d783 100644
--- a/drivers/gpu/nova-core/gpu.rs
+++ b/drivers/gpu/nova-core/gpu.rs
@@ -53,6 +53,7 @@
         GpuMm,
         VramAddress, //
     },
+    timer::Timer,
     vgpu::VgpuManager, //
 };
 
@@ -331,6 +332,8 @@ struct GspResources<'gpu> {
     // TODO: use different resource types for each boot method, and make the relevant Gsp methods
     // generic against them.
     fsp: Option<Fsp<'gpu>>,
+    /// Timer instance - contains offset
+    timer: Timer,
     /// vGPU state detected before GSP boot.
     vgpu: VgpuManager,
     /// GSP runtime data.
@@ -497,6 +500,8 @@ pub(crate) fn new<'a>(
 
                 fsp: Fsp::try_new(dev, bar, spec.chipset)?,
 
+                timer: Timer::new(bar, spec.chipset)?,
+
                 vgpu: VgpuManager::new(pdev, spec.chipset, fsp.as_mut()),
 
                 gsp <- Gsp::new(pdev, bar),
diff --git a/drivers/gpu/nova-core/nova_core.rs b/drivers/gpu/nova-core/nova_core.rs
index a8f6dc22057b..ee59d81e5105 100644
--- a/drivers/gpu/nova-core/nova_core.rs
+++ b/drivers/gpu/nova-core/nova_core.rs
@@ -27,6 +27,7 @@
 mod sbuffer;
 #[cfg(CONFIG_NOVA_CORE_SELFTESTS)]
 mod selftest;
+mod timer;
 mod vbios;
 mod vgpu;
 
diff --git a/drivers/gpu/nova-core/regs.rs b/drivers/gpu/nova-core/regs.rs
index 88662da634dc..d5c67625b561 100644
--- a/drivers/gpu/nova-core/regs.rs
+++ b/drivers/gpu/nova-core/regs.rs
@@ -419,6 +419,24 @@ pub(crate) fn mem_scrubbing_done(self) -> bool {
     }
 }
 
+// PTIMER
+
+register! {
+    base: NovaRegisters;
+
+    pub(crate) NV_PTIMER_TIME_PRIV_LEVEL_MASK(u32) @ 0x00009430 {
+        4:4 level0 => bool;
+    }
+
+    pub(crate) NV_PTIMER_TIME_0(u32) @ 0x00009400 {
+        31:5 nsec;
+    }
+
+    pub(crate) NV_PTIMER_TIME_1(u32) @ 0x00009410 {
+        28:0 nsec;
+    }
+}
+
 // The modules below provide registers that are not identical on all supported chips. They should
 // only be used in HAL modules.
 
@@ -520,6 +538,28 @@ pub(crate) mod gh100 {
             31:0    fsp_boot_complete;
         }
     }
+
+    // PGC6/TIMER
+    register! {
+        base: NovaRegisters;
+
+        pub(crate) NV_PGC6_SCI_SEC_TIMER_TIME_0(u32) @ 0x00118f54 {
+            31:5 nsec;
+        }
+
+        pub(crate) NV_PGC6_SCI_SEC_TIMER_TIME_1(u32) @ 0x00118f58 {
+            28:0 nsec;
+        }
+
+        pub(crate) NV_PGC6_SCI_SYS_TIMER_OFFSET_0(u32) @ 0x00118df4 {
+            0:0 update;
+            31:5 nsec;
+        }
+
+        pub(crate) NV_PGC6_SCI_SYS_TIMER_OFFSET_1(u32) @ 0x00118df8 {
+            28:0 nsec;
+        }
+    }
 }
 
 pub(crate) mod gb202 {
diff --git a/drivers/gpu/nova-core/timer.rs b/drivers/gpu/nova-core/timer.rs
new file mode 100644
index 000000000000..7fcb9cff8648
--- /dev/null
+++ b/drivers/gpu/nova-core/timer.rs
@@ -0,0 +1,37 @@
+// SPDX-License-Identifier: GPL-2.0
+
+mod hal;
+
+use kernel::{
+    prelude::*,
+    time::*, //
+};
+
+use crate::{
+    driver::Bar0,
+    gpu::Chipset, //
+};
+
+#[pin_data]
+pub(crate) struct Timer {
+    chipset: Chipset,
+    sys_timer_offset_ns: i64,
+}
+
+impl Timer {
+    pub(crate) fn new(bar: Bar0<'_>, chipset: Chipset) -> Result<Self> {
+        Ok(Self {
+            chipset,
+            sys_timer_offset_ns: hal::timer_hal(chipset).init(chipset, bar)?,
+        })
+    }
+
+    #[expect(dead_code)]
+    pub(crate) fn sys_timer_offset_ns(&self) -> i64 {
+        self.sys_timer_offset_ns
+    }
+}
+
+pub(crate) fn get_cpu_time_ns() -> i64 {
+    Instant::<Monotonic>::now().as_nanos()
+}
diff --git a/drivers/gpu/nova-core/timer/hal.rs b/drivers/gpu/nova-core/timer/hal.rs
new file mode 100644
index 000000000000..2a383cf7688c
--- /dev/null
+++ b/drivers/gpu/nova-core/timer/hal.rs
@@ -0,0 +1,32 @@
+// SPDX-License-Identifier: GPL-2.0
+
+use kernel::prelude::*;
+
+use crate::{
+    driver::Bar0,
+    gpu::{
+        Architecture,
+        Chipset, //
+    },
+};
+
+mod gh100;
+mod tu102;
+
+pub(crate) trait TimerHal {
+    /// return system timer offset ns
+    fn init(&self, chipset: Chipset, bar: Bar0<'_>) -> Result<i64>;
+
+    /// read the timer
+    #[allow(dead_code)]
+    fn timer_read(&self, bar: Bar0<'_>) -> u64;
+}
+
+pub(super) fn timer_hal(chipset: Chipset) -> &'static dyn TimerHal {
+    match chipset.arch() {
+        Architecture::Turing | Architecture::Ampere | Architecture::Ada => tu102::TU102_HAL,
+        Architecture::Hopper | Architecture::BlackwellGB10x | Architecture::BlackwellGB20x => {
+            gh100::GH100_HAL
+        }
+    }
+}
diff --git a/drivers/gpu/nova-core/timer/hal/gh100.rs b/drivers/gpu/nova-core/timer/hal/gh100.rs
new file mode 100644
index 000000000000..e917446e7b01
--- /dev/null
+++ b/drivers/gpu/nova-core/timer/hal/gh100.rs
@@ -0,0 +1,61 @@
+// SPDX-License-Identifier: GPL-2.0
+
+use super::TimerHal;
+
+use kernel::{
+    io::Io,
+    prelude::*, //
+};
+
+use crate::{
+    driver::Bar0,
+    gpu::Chipset,
+    regs,
+    timer,
+    timer::hal::tu102, //
+};
+
+struct Gh100;
+
+pub(crate) fn timer_time(bar: Bar0<'_>, chipset: Chipset, time_ns: u64) -> Result<u64> {
+    let sec_hi2 = u32::from(bar.read(regs::gh100::NV_PGC6_SCI_SEC_TIMER_TIME_1));
+    let sec_timer_ns: u64;
+    loop {
+        let sec_lo = u32::from(bar.read(regs::gh100::NV_PGC6_SCI_SEC_TIMER_TIME_0));
+        let sec_hi = u32::from(bar.read(regs::gh100::NV_PGC6_SCI_SEC_TIMER_TIME_1));
+        if sec_hi == sec_hi2 {
+            sec_timer_ns = u64::from(sec_hi) << 32 | u64::from(sec_lo);
+            break;
+        }
+    }
+
+    let sys_timer_offset_ns = time_ns - sec_timer_ns;
+
+    // kfspRequiresBug3957833WAR_HAL
+    if chipset != Chipset::GH100 {
+        bar.write_reg(
+            regs::gh100::NV_PGC6_SCI_SYS_TIMER_OFFSET_1::zeroed()
+                .try_with_nsec((sys_timer_offset_ns >> 32) as u32)?,
+        );
+        bar.write_reg(
+            regs::gh100::NV_PGC6_SCI_SYS_TIMER_OFFSET_0::zeroed()
+                .try_with_nsec((time_ns & 0xffffffff) as u32)?,
+        );
+    }
+    Ok(sys_timer_offset_ns)
+}
+
+impl TimerHal for Gh100 {
+    fn init(&self, chipset: Chipset, bar: Bar0<'_>) -> Result<i64> {
+        let cpu: i64 = timer::get_cpu_time_ns();
+        let sys_timer_offset_ns = timer_time(bar, chipset, cpu as u64)?;
+        Ok(sys_timer_offset_ns as i64)
+    }
+
+    fn timer_read(&self, bar: Bar0<'_>) -> u64 {
+        tu102::timer_read(bar)
+    }
+}
+
+const GH100: Gh100 = Gh100;
+pub(super) const GH100_HAL: &dyn TimerHal = &GH100;
diff --git a/drivers/gpu/nova-core/timer/hal/tu102.rs b/drivers/gpu/nova-core/timer/hal/tu102.rs
new file mode 100644
index 000000000000..06ef88171f58
--- /dev/null
+++ b/drivers/gpu/nova-core/timer/hal/tu102.rs
@@ -0,0 +1,55 @@
+// SPDX-License-Identifier: GPL-2.0
+
+use super::TimerHal;
+
+use kernel::{
+    io::Io,
+    prelude::*, //
+};
+
+use crate::{
+    driver::Bar0,
+    gpu::Chipset,
+    regs,
+    timer, //
+};
+struct Tu102;
+
+pub(crate) fn timer_read(bar: Bar0<'_>) -> u64 {
+    let hi2: u32 = u32::from(bar.read(regs::NV_PTIMER_TIME_1));
+    loop {
+        let lo = u32::from(bar.read(regs::NV_PTIMER_TIME_0));
+        let hi = u32::from(bar.read(regs::NV_PTIMER_TIME_1));
+        if hi == hi2 {
+            return u64::from(hi) << 32 | u64::from(lo);
+        }
+    }
+}
+
+pub(crate) fn timer_time(bar: Bar0<'_>, time_ns: u64) -> Result {
+    if bar.read(regs::NV_PTIMER_TIME_PRIV_LEVEL_MASK).level0() {
+        bar.write_reg(regs::NV_PTIMER_TIME_1::zeroed().try_with_nsec((time_ns >> 32) as u32)?);
+        bar.write_reg(
+            regs::NV_PTIMER_TIME_0::zeroed().try_with_nsec((time_ns & 0xffffffff) as u32)?,
+        );
+        Ok(())
+    } else {
+        Err(EINVAL)
+    }
+}
+
+impl TimerHal for Tu102 {
+    fn init(&self, _chipset: Chipset, bar: Bar0<'_>) -> Result<i64> {
+        let cpu = timer::get_cpu_time_ns();
+
+        timer_time(bar, cpu as u64)?;
+        Ok(0_i64)
+    }
+
+    fn timer_read(&self, bar: Bar0<'_>) -> u64 {
+        timer_read(bar)
+    }
+}
+
+const TU102: Tu102 = Tu102;
+pub(super) const TU102_HAL: &dyn TimerHal = &TU102;

-- 
2.56.0


