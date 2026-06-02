Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010023.outbound.protection.outlook.com [52.101.61.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FACD36F42D
	for <nova-gpu@lists.linux.dev>; Tue,  2 Jun 2026 03:21:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.61.23
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780370517; cv=fail; b=NOTbQ5itd+ipf2lCcvOMxfNo5DGh2KDQ3AzNbkQrRMAV6BWdPObPIb3/3Rfv4y373H8dmd/ysNNHwyA52WUGS8RS/UiYbe/stT2QEuNTj7Ha37+H2thTHBmE+lhUA8EUagzASRKEsCJ+hbZV8karMfNbfDKCWc/AHQJWHIB9TLE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780370517; c=relaxed/simple;
	bh=4fuMqhSldwtrmKFevn/tsjkPg2YN0sg8esTbTvVyASc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Q4Opoje/+3IZy3bjIE+kBycVpyIMVJb8NgzoCIqfqWGwfj+6cylBpPEDP38OdQhiQZDUKPoqMspl8oH/iXKhC+GnUhp6g/PjQV1dZNLZ9INjW0GRgqz84Sj6FnqdkXie6JdIZ/23FG/y3rWo0PfYzMUrkFBxxlI3PmXY2gi6PbE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=LfVCtjaJ; arc=fail smtp.client-ip=52.101.61.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="LfVCtjaJ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W2hhK207CkFUJN3LhcsxTxoW/WuWRpp1D1oTuiqzdtXvZiX4k1dqqNub0FiPbY/7Bv6+u7Fx3hDuYqZk0vlCV/1f1/b5mEbl5k+PK5rfhd53cCdFk5nC6cQULsQdYTN1sdYWU5HuSHFw4HODKXPzobq0qkYYedbOj2YB++YnobL0OtVHoZMBJXMZpwsiiSHT6YvI2C9QUxIiTgpHHIJC3F8JWaqqozswSFtw5sL0r3gWrr0aERJ2lny8r/T8E6WrlluYOxG+rlGiE8K7CKc4npjDKGd+n8btluCVejAHGO2K4fSPNf+CYgnAs1SUn52HCtfhvFrmmH81NOAH8/J4Rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uG5CIwMI1fs1gwR8+JXpXAW/VTSaDaNSk1wiqrk8gN8=;
 b=AYOjG1T67+ErEGFv3CDfZXfcNWl+Ir44XZMqYanTE1B/zpaFMAsBwcuGm70wt441FxGlBwUS5SQkOMUA0Wj8gsne1Ci7AwlVjHhNd/CXDvy2dxEvCcx++aT2QZKfuZpY0FieCX1XXiykY9ZwUpjlh0+0wmbaEbFAKn+CfARyPm1Pm8wKvSRmh4zmFTwX33FseIywD2+LpMieh8aYxzOkiaSxT7qfuv4TCZwbj/p+lS0aRK1YcwlHJ4xwZ9C3waGzWrpUr3XRXM8v3Skl/tsJCaj4Hz3jzeCWSsByIaeo9NGKC7+vQ9la99bi1dvnJ2/sKEjbNY9o3P4t60qMe1Nt8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uG5CIwMI1fs1gwR8+JXpXAW/VTSaDaNSk1wiqrk8gN8=;
 b=LfVCtjaJFxvAcsgSSbEdyaVuvzHz8Y3xmRBWIjA4/TS5O1cunCy3VSbObiid0l3xFhWQ1+QabzWuiYii9L2J9o5nMzoyq47JVN16TlF3IZ5kJu+rHKrW7ngiHs3qBbEyp38rnFiDb3mN9RXGLn4b2hUEAvli5rrH/ELNAIim6qdMkk8RCRGlAvknAf/jXQemOVHeP/o3AVyUmjus7TejRxg1Fuhjz0K2HGmyNLvBqE4ljYvU5gEhE+OhqekJt7qqWBDePL/78sxVKRO9pPNdp4KqO2u4PwRwJtnUtxMMVKAn7+Q1rbcn3ob448oE+YppnbGe2YTMMtpN/mK230ldKg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 MN6PR12MB8565.namprd12.prod.outlook.com (2603:10b6:208:47d::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.16; Tue, 2 Jun 2026
 03:21:31 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%5]) with mapi id 15.21.0071.015; Tue, 2 Jun 2026
 03:21:31 +0000
From: John Hubbard <jhubbard@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>
Cc: Timur Tabi <ttabi@nvidia.com>,
	Alistair Popple <apopple@nvidia.com>,
	Eliot Courtney <ecourtney@nvidia.com>,
	Shashank Sharma <shashanks@nvidia.com>,
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
	LKML <linux-kernel@vger.kernel.org>,
	John Hubbard <jhubbard@nvidia.com>
Subject: [PATCH v12 14/22] gpu: nova-core: Hopper/Blackwell: add FSP falcon EMEM operations
Date: Mon,  1 Jun 2026 20:21:02 -0700
Message-ID: <20260602032111.224790-15-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260602032111.224790-1-jhubbard@nvidia.com>
References: <20260602032111.224790-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0069.namprd13.prod.outlook.com
 (2603:10b6:a03:2c4::14) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|MN6PR12MB8565:EE_
X-MS-Office365-Filtering-Correlation-Id: a10f41eb-d43b-4e01-7af7-08dec0560a97
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|366016|22082099003|18002099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	IVq++PofCEE7C0Ruen9Tu0rUtK5fzT04I/CJqxKkt277xGQQww05l5p0zR+3bu0ZO5Qng8uQcEzoK583tKcwk+OEuQl+jz+QsbAN0py9K1Lgdz0aAZ84X71bAPbHKVDZPFPfWihC4Ccffsd064qQR95mkqI5mgYaUQJN5BjzDVvAzaP1utY4k/VX/ovcL/2oMbSjo18Khsw8lRWS3QUScruKl/f3G+KeQdVDuOL4KYx/8gwSeYb5jPiGiulL9PrROEcsRahcT4qzmFyGvcF6Q8wCrd0v7qADQBZAsaHsC/u8tJxnIAsVNmZRlpM4CQWNBYmL/ItrG7n5Gs9tmJpYDQQZuEQ8uVhuc9QCUKIvHHgsRKS+XPg4vZ80bPCGJHs50dHhh9iCl4UPpQTiIGyQvNwCB9ts2ZIRRMp5jgvsXCTUXgZeYbZsx3UawYph1W22HBNIxrg8wrRpGLxE+GY42BQaSi2APmEfUWYOFZfnAcbFaKBBoXDkFyp9Ptz/RIIL/fL2cEnu7YDKXuqws/ERmAZ34fKFhL17w8UtJs7L0oNDQ2Phl0Jlq5PsoUjbFWSgwn6H2no+6VXliwExJQxsO2ahMNmVmAopFunWVmjv0K/PvVq0CKl1IIgAg1fLlc8uvvsZI14ShMjrUOzz63mCUR8tJXWgKKbKTzFo9yW0wn0CGScaiI9wgbG/VHkog8f2
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(22082099003)(18002099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?HEBKb8WZ/YLAUyHWGHet7tZz9CEPNZBKZ31tSkBwb+WVdA6W/I71S7GChIC+?=
 =?us-ascii?Q?5m9LzkRTPTofP/ugBxg2QYYL10T9w+pQmwqlbLXeY1dcSRdjAT9ExFFbgE81?=
 =?us-ascii?Q?GWHFAU+U+4T9LRnmOVcKERSjzd3NfcOR1k6neiUu7RL8LlZcqxLL9BiknOjb?=
 =?us-ascii?Q?DUmg65K6tzNvgs6V9tV6iAsswBfOJMrjg51jzI+KIM3aJBu7gIRPHeXdXo4o?=
 =?us-ascii?Q?hUD9VSMty0L2pj+OUmjO4fP1BNKZ44jzt2mTWu/QepvcqjF6apQ+INCzVWv5?=
 =?us-ascii?Q?fKaoK6iVQM/iOwlx9dMQRofbkWwoi/mNHYKcTEi83fbp7N4n9NjadxE5dgkX?=
 =?us-ascii?Q?eVv3TuFGUjjcgXJHhiGtlxLoUyGY1mN03pdTwuICvF+wuZ3JK+JVWaykqP7A?=
 =?us-ascii?Q?YZmou9/Tx53/RMkLzhCL866zwxv1wai+ep+GUcfOAh35/4f0jtVVgDxga/ZN?=
 =?us-ascii?Q?Em7AvPV63Jxwyizn18MxUIY2kcnvF38l+wEfXhc52h6X0wlHYWjk7EwlMQJa?=
 =?us-ascii?Q?xtMBmCJHaviVRgBokUf6l0cKelK18sYv7w+HBgblKngGzsJrPBq1o6jHuOIu?=
 =?us-ascii?Q?f9qDjVlV6+F5Kn7BKfaLv5hxQ+5L/vk7pjyyK7O5x4u0urkdnP/OnzAiRAMm?=
 =?us-ascii?Q?3VDaVaX51+D1sx/PnkKYgQYJ7om06LnBh4fSK667wz4fhkOM4ePKdGdgS7U7?=
 =?us-ascii?Q?pMoXOo2WVfT9mBJyVQTiFY2XUTCqrU7US2UOa2GCEX5bfqhHQJo01cq5qFxq?=
 =?us-ascii?Q?hlI3EO3Se1gGykngw42EZSgBghZqh8ma07dHXVwJKteB9s3H4EQ3OcKLpGZC?=
 =?us-ascii?Q?9ES5XDbhXn8XcMXEin5uW13INUxsuMr+6+WqEnm2qic2EPhFEn6czL7UElLD?=
 =?us-ascii?Q?QQASBccKbi1KMOrhivYwybBBOCvkTNXusvFdc+MOvrtiHhcPHhOjzxZkXrLv?=
 =?us-ascii?Q?0iykvhRE+LKG1ab2bWqtiIfNhuvaNQNB4VdV2648ypSwzAecT/Va+VUUB1Ve?=
 =?us-ascii?Q?cJMeD0LlZAd/DmABqj7kttk3lu9tWZYW+3N3piT1/a0VPR+5wUAkztGaZGLB?=
 =?us-ascii?Q?HAdzQJ1dpzmx6qIWR8CLvMk6n1gu7bXSYX0j60l6Pnztpom49oD6peHT+zGq?=
 =?us-ascii?Q?XZJS425s4XjQwok+BL1RmIdkbhrMPeRvpRxTTYlTqTC2yy6C062e/sP8PBzc?=
 =?us-ascii?Q?a3oW6eclnejymRdFZEafzbJhsqXhxuP1mnZiQtEdlUQDP4LWrs4tO3lNRjlK?=
 =?us-ascii?Q?akA2jIExFA+9Rro/rE8ySgtUyzpQUFkBNh5mIKWqoFNu6np/bSwkXdGlsQXr?=
 =?us-ascii?Q?4yI6+rAAi1INoj8nRZfsdiQ4C+0HjidNQjUyp3WRGFpuS/FtB9rzMwRo2K7G?=
 =?us-ascii?Q?L24qxyZs4ewX34et6t6exGuRJECahmKYCwFt2A8Aacd19KdrUWBAR+nx4kdy?=
 =?us-ascii?Q?kuvUs9Hh1okXfZvWilqlheet/W6fOijK3Qs2mYBqPn0gP/Yl9zdOrB/3PMRZ?=
 =?us-ascii?Q?6H/Stx88BRdBa4xhGYJ7UAHwAh5qJFcdggIlmvkjtvvJEoKhoJAXSKCLtND/?=
 =?us-ascii?Q?HKtrpv9xi5jD92zwPp6m8nGqDY8C+1D0iBL1EJLxjUCqD7Rb7PF3DmL8l2JB?=
 =?us-ascii?Q?++bQ6T1Ax62eXKEdhLEE2bBHTwt4+0f2JUABRXwE+6ryYN/8nivAJQYQz7j9?=
 =?us-ascii?Q?LC0Onkx1P3OiI5rYHWsgNprfrfR9SIrrD7fcOk9DUcWgla3vIV2zSNAUz4yw?=
 =?us-ascii?Q?ZaLew/pzKg=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a10f41eb-d43b-4e01-7af7-08dec0560a97
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2026 03:21:31.2177
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aH1ZJrA1vuYwY1rvK7lNwYgTuf7CtIfxexpa/9q9pB0WYQv403nO3F49oQrwNUaVriT5Y8Y0urBbJoSPYNbgXA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR12MB8565

Add external memory (EMEM) read/write operations to the GPU's FSP falcon
engine. These operations use Falcon PIO (Programmed I/O) to communicate
with the FSP through indirect memory access.

Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/falcon/fsp.rs | 130 ++++++++++++++++++++++++++--
 drivers/gpu/nova-core/regs.rs       |  15 ++++
 2 files changed, 140 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/nova-core/falcon/fsp.rs b/drivers/gpu/nova-core/falcon/fsp.rs
index d9f87262e8b1..6b057d958115 100644
--- a/drivers/gpu/nova-core/falcon/fsp.rs
+++ b/drivers/gpu/nova-core/falcon/fsp.rs
@@ -6,12 +6,28 @@
 //! The FSP falcon handles secure boot and Chain of Trust operations
 //! on Hopper and Blackwell architectures, replacing SEC2's role.
 
-use kernel::io::register::RegisterBase;
+use kernel::{
+    io::{
+        register::{
+            RegisterBase,
+            WithBase, //
+        },
+        Io, //
+    },
+    num::Bounded,
+    prelude::*,
+    ptr::Alignment, //
+};
 
-use crate::falcon::{
-    FalconEngine,
-    PFalcon2Base,
-    PFalconBase, //
+use crate::{
+    driver::Bar0,
+    falcon::{
+        Falcon,
+        FalconEngine,
+        PFalcon2Base,
+        PFalconBase, //
+    },
+    regs,
 };
 
 /// Type specifying the `Fsp` falcon engine. Cannot be instantiated.
@@ -26,3 +42,107 @@ impl RegisterBase<PFalcon2Base> for Fsp {
 }
 
 impl FalconEngine for Fsp {}
+
+/// Maximum addressable EMEM size, derived from the 24-bit offset field
+/// in `NV_PFALCON_FALCON_EMEM_CTL`.
+const EMEM_MAX_SIZE: Alignment = Alignment::new::<{ 1 << 24 }>();
+
+/// I/O backend for the FSP falcon's external memory (EMEM).
+///
+/// `EMEM_CTL` is programmed once with a start offset and an auto-increment
+/// mode, then each access to `EMEM_DATA` advances the offset by one 32-bit
+/// word in hardware.
+struct Emem<'a> {
+    bar: &'a Bar0,
+}
+
+impl<'a> Emem<'a> {
+    fn new(bar: &'a Bar0) -> Self {
+        Self { bar }
+    }
+
+    /// Programs `EMEM_CTL` with the start byte `offset` and the `ctl` mode bits.
+    ///
+    /// Returns `EINVAL` if `offset` is outside the addressable EMEM window.
+    fn program(&mut self, offset: usize, ctl: regs::NV_PFALCON_FALCON_EMEM_CTL) -> Result {
+        let offset = Bounded::<usize, { EMEM_MAX_SIZE.log2() }>::try_new(offset)
+            .map(Bounded::cast::<u32>)
+            .ok_or(EINVAL)?;
+
+        self.bar
+            .write(WithBase::of::<Fsp>(), ctl.with_offset(offset));
+
+        Ok(())
+    }
+
+    /// Begins a write burst at byte `offset`, auto-incrementing on each write.
+    fn begin_write(&mut self, offset: usize) -> Result {
+        self.program(
+            offset,
+            regs::NV_PFALCON_FALCON_EMEM_CTL::zeroed().with_auto_increment_write(true),
+        )
+    }
+
+    /// Begins a read burst at byte `offset`, auto-incrementing on each read.
+    fn begin_read(&mut self, offset: usize) -> Result {
+        self.program(
+            offset,
+            regs::NV_PFALCON_FALCON_EMEM_CTL::zeroed().with_auto_increment_read(true),
+        )
+    }
+
+    /// Writes the next 32-bit `value`; hardware advances the offset.
+    fn write_next(&mut self, value: u32) {
+        self.bar.write(
+            WithBase::of::<Fsp>(),
+            regs::NV_PFALCON_FALCON_EMEM_DATA::zeroed().with_data(value),
+        );
+    }
+
+    /// Reads the next 32-bit word; hardware advances the offset.
+    fn read_next(&mut self) -> u32 {
+        self.bar
+            .read(regs::NV_PFALCON_FALCON_EMEM_DATA::of::<Fsp>())
+            .data()
+    }
+}
+
+impl Falcon<Fsp> {
+    /// Writes `data` to FSP external memory at byte `offset`.
+    ///
+    /// `data` is interpreted as little-endian 32-bit words. Returns `EINVAL`
+    /// if `offset` or the `data` length is not 4-byte aligned.
+    #[expect(dead_code)]
+    fn write_emem(&mut self, bar: &Bar0, offset: u32, data: &[u8]) -> Result {
+        if offset % 4 != 0 || data.len() % 4 != 0 {
+            return Err(EINVAL);
+        }
+
+        let mut emem = Emem::new(bar);
+        emem.begin_write(offset as usize)?;
+        for chunk in data.chunks_exact(4) {
+            emem.write_next(u32::from_le_bytes([chunk[0], chunk[1], chunk[2], chunk[3]]));
+        }
+
+        Ok(())
+    }
+
+    /// Reads FSP external memory at byte `offset` into `data`.
+    ///
+    /// `data` is stored as little-endian 32-bit words. Returns `EINVAL` if
+    /// `offset` or the `data` length is not 4-byte aligned.
+    #[expect(dead_code)]
+    fn read_emem(&mut self, bar: &Bar0, offset: u32, data: &mut [u8]) -> Result {
+        if offset % 4 != 0 || data.len() % 4 != 0 {
+            return Err(EINVAL);
+        }
+
+        let mut emem = Emem::new(bar);
+        emem.begin_read(offset as usize)?;
+        for chunk in data.chunks_exact_mut(4) {
+            chunk.copy_from_slice(&emem.read_next().to_le_bytes());
+        }
+
+        Ok(())
+    }
+}
diff --git a/drivers/gpu/nova-core/regs.rs b/drivers/gpu/nova-core/regs.rs
index 2cb1f02f35a4..da7a10c0346a 100644
--- a/drivers/gpu/nova-core/regs.rs
+++ b/drivers/gpu/nova-core/regs.rs
@@ -475,6 +475,21 @@ pub(crate) fn vga_workspace_addr(self) -> Option<u64> {
     pub(crate) NV_PFALCON_FBIF_CTL(u32) @ PFalconBase + 0x00000624 {
         7:7     allow_phys_no_ctx => bool;
     }
+
+    // Falcon EMEM PIO registers (used by FSP on Hopper/Blackwell).
+    // These provide the falcon external memory communication interface.
+    pub(crate) NV_PFALCON_FALCON_EMEM_CTL(u32) @ PFalconBase + 0x00000ac0 {
+        /// EMEM byte offset (must be 4-byte aligned).
+        23:0    offset;
+        /// Auto-increment the offset after each write.
+        24:24   auto_increment_write => bool;
+        /// Auto-increment the offset after each read.
+        25:25   auto_increment_read => bool;
+    }
+
+    pub(crate) NV_PFALCON_FALCON_EMEM_DATA(u32) @ PFalconBase + 0x00000ac4 {
+        31:0    data => u32;
+    }
 }
 
 impl NV_PFALCON_FALCON_DMACTL {
-- 
2.54.0

