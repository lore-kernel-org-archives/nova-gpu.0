Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011019.outbound.protection.outlook.com [40.93.194.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CBD633F5AE
	for <nova-gpu@lists.linux.dev>; Wed, 10 Jun 2026 17:50:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781113821; cv=fail; b=ayOX58oCHLfXbQLx8E/psAhH/I+RIlrpZw2GvUAoHENMIBb+QagVlWPG526KmH/9KRDlIttuRlhSvgrmjiZDtdeeTRyUrAnkVx3S2NOmdog34frJfqTACkR5J8KZObBw8g6OIfOfIsu9bMrg6XgBmAsc/bKia2lL5yPOvy1SycQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781113821; c=relaxed/simple;
	bh=rvOyKS5r8W733yON6wtcCMjrrtmF07b/ju82jXJ1Foo=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ewdJro9b/X4GxMr7JoFFC5/AdBKJdUA5iaEtI6f1MtcekGUYf0X/zhv6IHS/X2hWUJXoc0c94I+HDE/BJfxhovTTbIUY18vq8+qCPZBTNN+cqqDESU+fJ/POTYzXDugNLDAJfU2292EMWVsryD6V5PzVednM6KpjacLIgMl7ORY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=n41C+bW6; arc=fail smtp.client-ip=40.93.194.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="n41C+bW6"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cMUDuJJe8rcMZXB1c8gUQE6vcZ+saIydk5MxNf52G9irGKkoT0OqSq1JxYfcoDLtgdTEyY3xmeyALmjN2HlFMCtkt3pGOOGwvP3v6ig6jibTjLrfFR8MeEIqnkyUSkN6OhI8M6iCAuUIaTP4gtOLZtlbJM9aHRUUa26thKeV6iN5+8wwjRx120t25awJpwpRmaFLZtbr4+Vje1Wm7FxylTkqXxjhFE0cj8OdNzi3AMDgmxgnwSEi9y7aDAWPQEVGO0kvhucv+BN/I6UJAM0X6tSWUVmvM1YBctTEm/nr/l2qwZYpGPa7bE4yodTJWGFSJISkH/F2c0scWomxNyWAdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=32c6mYGEfVQXK5hE1yZwR4OmDKL7gWxCdVU06FQhT6M=;
 b=vnRqDGQDQCtNn7uYNHflYH3nMALgkOvB2GPZ6Lyls7Hdu1+5q1SONlDYolVOxhBBIPgmyOhuS8Bgkr6SAbJuHd2imklfejAQ/VIHSwIqVaEIytgOGZMWcwWUp4CfKwoi4MN1Fd//2yJBPZv52EgHdM4P3J4dsfUs3IFL6aajU46msv/9cuKfffvbJhyemIf0WLOU1Gr6M7udNCTdfxxUMbCI1H+r1/6PHDLdP6VOOm7EnrU4nBgdO+Y8vFt7RZp98kEv+s3YN0u0BoulO93+xLB5cYiKosSwOYocs3XijYGH+SdO8OkyDeOzbh8kuPAwbCfudqG1wzv4OKTQoHcKWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=32c6mYGEfVQXK5hE1yZwR4OmDKL7gWxCdVU06FQhT6M=;
 b=n41C+bW6FxHEiMbKCtHNPRfL2DwpSEDKJzr1/AhSXXmIg1imdcRTEt6LrPX9R2fFa76jRr8BIVhA9fjhEc13jt+/dCY4ow99W+UoIBtk40haK97/c4/rPCh9b4pz7sAXNTgDttBmhkBT/tJRyjPWIkHMU/etaXLND3N3Rj2OARSkDDufTB8WFljUr7U5Z+nNEy6GVzYk+iTRAMYiNU6xr1LNxJrGp5n8MHSFgnA0+gs0ik64hCCntDbLEIbV4IDIsjFbvb6jsjjKp0tMMQvgd0TcZGS2yQ1yBHk6HwcjVkJN6wOd8aba3ScQh+lTu8D+YjHi9yrLRzTO+PrA8Be2aA==
Received: from CYXPR03CA0050.namprd03.prod.outlook.com (2603:10b6:930:d1::15)
 by DS0PR12MB7655.namprd12.prod.outlook.com (2603:10b6:8:11e::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.15; Wed, 10 Jun
 2026 17:50:12 +0000
Received: from CH1PEPF0000A347.namprd04.prod.outlook.com
 (2603:10b6:930:d1:cafe::1e) by CYXPR03CA0050.outlook.office365.com
 (2603:10b6:930:d1::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.113.12 via Frontend Transport; Wed,
 10 Jun 2026 17:50:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CH1PEPF0000A347.mail.protection.outlook.com (10.167.244.7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.113.7 via Frontend Transport; Wed, 10 Jun 2026 17:50:12 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 10 Jun
 2026 10:49:49 -0700
Received: from ttabi.nvidia.com (10.126.230.37) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 10 Jun
 2026 10:49:47 -0700
From: Timur Tabi <ttabi@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Gary Guo <gary@garyguo.net>,
	"Alexandre Courbot" <acourbot@nvidia.com>, <nova-gpu@lists.linux.dev>, Eliot
 Courtney <ecourtney@nvidia.com>, John Hubbard <jhubbard@nvidia.com>,
	<zhiw@nvidia.com>
Subject: [PATCH 7/8] gpu: nova-core: transition fsp to TLV images
Date: Wed, 10 Jun 2026 12:49:28 -0500
Message-ID: <20260610174929.744477-8-ttabi@nvidia.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260610174929.744477-1-ttabi@nvidia.com>
References: <20260610174929.744477-1-ttabi@nvidia.com>
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: rnnvmail203.nvidia.com (10.129.68.9) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000A347:EE_|DS0PR12MB7655:EE_
X-MS-Office365-Filtering-Correlation-Id: 24cb6633-e04c-47b8-ebef-08dec718b8b4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700016|23010399003|18002099003|22082099003|6133799003|3023799007|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	4x/TEXv2+AvV31BKIJ7aWLxWNjgET6FLfO9cfqWMEKr6+ALfB94YgvtOczyvRL52ODm7omTMrGZKIEdzSzufP3uMK8AxJfrY0MGX6/OErGi0WBqf/GcNywkRSfQ4eTuIRvLkxUgNqMIIsmGRGK7xCv6SzRe9sCchFXFEPnpukgp6HRTedopXccDjUxV5OCDtBTCSNFyieVH5n1yemOcOoztDIEcB4noOje9RddHUMaglgmO2pJ/9gRgVSlRL/REGxkvdJHmHPVSWnjXnjRoLFXJ+0tE43dbg/gBOcnt+z8LNjvuO2nXn6mAy4KLU46TB4WZ/trRgTK9MDF6P0aLPceGEx15koSoykw27xTjt0WLLM1b5/iXj4rGKXu3atxCQts7xW+Vdl5UNqMC+LymVYtCmn4Y9vKR7KhS4ybq7XaCswOv4oHJZWh+I/PDPGo6s12IixbmOX1mQ2c+JyeUwzZ5qwaT1yQNz0dfo+eZSPLQAumabIvzriYfJ3rzzmISYlOtnAZjnrQxS2x7OcWwOO6+UG3O3q7/7dWEm2o9Wa5FqhMxWUYHMaKWHqSovS3RkSzWgy7hOmtyq7RunjGiAJGFgbsjkTorqDL408yNwxtm5BYcU1tXbEZ7DYDVpFLgs1i7L6r2SW/MXTKGb9QolsEJJjwRYU1Q7TYYbEkEsdja72/7i+UO5pcYzlJr6LkRKlAmRNV3nT05g5bAzMhA/cGS/QFZhoVwl/X7os3SuBDI=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700016)(23010399003)(18002099003)(22082099003)(6133799003)(3023799007)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	8F33wqJHKRDI/VFq0LtKJGWEGYKbf9hgBLOuaB7DmTbrry5GjA69oHXr0EF+0eMJhA3imkQS9mPMj8k5kaNv5LhcaB/bt83qMPdUEVDVdLEI8zWUhiQuQEXyKQmRWSNNvlBUdwCXRloTlJN9VoaR+eddD7yfxo7sAVqjyYhjj3TqMUiGd/9ndLodzltF+4uEfZOfdf+bamrFDItzpkX//SCkOLfqFLm64lR3Lry6UeXa9po1ppU3RpKRDXKWGfWRgzhQ+LCO11GTlUzbNsaKjineVOdPWcma9vL0D0xx9hHbUE/bS7AoOrdAH8IbGw7zM3BaJX/V5Mq75ufbibfIlKg6K63KJu1h/dYzLqafb9gItf16K1J6CH3vjrtx7CceduVT1gAD26G657N4dZAeXXLS18eBRtJTc0gifETAktQkSkFWjb609cFg19lT3E1Y
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2026 17:50:12.3638
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 24cb6633-e04c-47b8-ebef-08dec718b8b4
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000A347.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7655

Switch the FSP firmware loaders from the legacy ELF32 format to the new
TLV format.  This change requires the new TLV versions of the r570.144
firmware images.

Because we are no longer loading ELF images, we can also delete the ELF
parser.

Signed-off-by: Timur Tabi <ttabi@nvidia.com>
---
 drivers/gpu/nova-core/firmware.rs      | 207 -------------------------
 drivers/gpu/nova-core/firmware/fsp.rs  |  84 +++++-----
 drivers/gpu/nova-core/gsp/hal/gh100.rs |   7 +-
 3 files changed, 39 insertions(+), 259 deletions(-)

diff --git a/drivers/gpu/nova-core/firmware.rs b/drivers/gpu/nova-core/firmware.rs
index fbc9e0cd0021..354945cafda2 100644
--- a/drivers/gpu/nova-core/firmware.rs
+++ b/drivers/gpu/nova-core/firmware.rs
@@ -421,213 +421,6 @@ pub(crate) const fn create(
     }
 }
 
-/// Ad-hoc and temporary module to extract sections from ELF images.
-///
-/// Some firmware images are currently packaged as ELF files, where sections names are used as keys
-/// to specific and related bits of data. Future firmware versions are scheduled to move away from
-/// that scheme before nova-core becomes stable, which means this module will eventually be
-/// removed.
-mod elf {
-    use core::mem::size_of;
-
-    use kernel::{
-        bindings,
-        str::CStr,
-        transmute::FromBytes, //
-    };
-
-    /// Trait to abstract over ELF header differences.
-    trait ElfHeader: FromBytes {
-        fn shnum(&self) -> u16;
-        fn shoff(&self) -> u64;
-        fn shstrndx(&self) -> u16;
-    }
-
-    /// Trait to abstract over ELF section-header differences.
-    trait ElfSectionHeader: FromBytes {
-        fn name(&self) -> u32;
-        fn offset(&self) -> u64;
-        fn size(&self) -> u64;
-    }
-
-    /// Trait describing a matching ELF header and section-header format.
-    trait ElfFormat {
-        type Header: ElfHeader;
-        type SectionHeader: ElfSectionHeader;
-    }
-
-    /// Newtype to provide a [`FromBytes`] implementation.
-    #[repr(transparent)]
-    struct Elf64Hdr(bindings::elf64_hdr);
-    // SAFETY: all bit patterns are valid for this type, and it doesn't use interior mutability.
-    unsafe impl FromBytes for Elf64Hdr {}
-
-    impl ElfHeader for Elf64Hdr {
-        fn shnum(&self) -> u16 {
-            self.0.e_shnum
-        }
-
-        fn shoff(&self) -> u64 {
-            self.0.e_shoff
-        }
-
-        fn shstrndx(&self) -> u16 {
-            self.0.e_shstrndx
-        }
-    }
-
-    #[repr(transparent)]
-    struct Elf64SHdr(bindings::elf64_shdr);
-    // SAFETY: all bit patterns are valid for this type, and it doesn't use interior mutability.
-    unsafe impl FromBytes for Elf64SHdr {}
-
-    impl ElfSectionHeader for Elf64SHdr {
-        fn name(&self) -> u32 {
-            self.0.sh_name
-        }
-
-        fn offset(&self) -> u64 {
-            self.0.sh_offset
-        }
-
-        fn size(&self) -> u64 {
-            self.0.sh_size
-        }
-    }
-
-    struct Elf64Format;
-
-    impl ElfFormat for Elf64Format {
-        type Header = Elf64Hdr;
-        type SectionHeader = Elf64SHdr;
-    }
-
-    /// Newtype to provide [`FromBytes`] and [`ElfHeader`] implementations for ELF32.
-    #[repr(transparent)]
-    struct Elf32Hdr(bindings::elf32_hdr);
-    // SAFETY: all bit patterns are valid for this type, and it doesn't use interior mutability.
-    unsafe impl FromBytes for Elf32Hdr {}
-
-    impl ElfHeader for Elf32Hdr {
-        fn shnum(&self) -> u16 {
-            self.0.e_shnum
-        }
-
-        fn shoff(&self) -> u64 {
-            u64::from(self.0.e_shoff)
-        }
-
-        fn shstrndx(&self) -> u16 {
-            self.0.e_shstrndx
-        }
-    }
-
-    /// Newtype to provide [`FromBytes`] and [`ElfSectionHeader`] implementations for ELF32.
-    #[repr(transparent)]
-    struct Elf32SHdr(bindings::elf32_shdr);
-    // SAFETY: all bit patterns are valid for this type, and it doesn't use interior mutability.
-    unsafe impl FromBytes for Elf32SHdr {}
-
-    impl ElfSectionHeader for Elf32SHdr {
-        fn name(&self) -> u32 {
-            self.0.sh_name
-        }
-
-        fn offset(&self) -> u64 {
-            u64::from(self.0.sh_offset)
-        }
-
-        fn size(&self) -> u64 {
-            u64::from(self.0.sh_size)
-        }
-    }
-
-    struct Elf32Format;
-
-    impl ElfFormat for Elf32Format {
-        type Header = Elf32Hdr;
-        type SectionHeader = Elf32SHdr;
-    }
-
-    /// Returns a NULL-terminated string from the ELF image at `offset`.
-    fn elf_str(elf: &[u8], offset: u64) -> Option<&str> {
-        let idx = usize::try_from(offset).ok()?;
-        let bytes = elf.get(idx..)?;
-        CStr::from_bytes_until_nul(bytes).ok()?.to_str().ok()
-    }
-
-    fn elf_section_generic<'a, F>(elf: &'a [u8], name: &str) -> Option<&'a [u8]>
-    where
-        F: ElfFormat,
-    {
-        let hdr = F::Header::from_bytes(elf.get(0..size_of::<F::Header>())?)?;
-
-        let shdr_num = usize::from(hdr.shnum());
-        let shdr_start = usize::try_from(hdr.shoff()).ok()?;
-        let shdr_end = shdr_num
-            .checked_mul(size_of::<F::SectionHeader>())
-            .and_then(|v| v.checked_add(shdr_start))?;
-
-        // Get all the section headers as an iterator over byte chunks.
-        let shdr_bytes = elf.get(shdr_start..shdr_end)?;
-        let mut shdr_iter = shdr_bytes.chunks_exact(size_of::<F::SectionHeader>());
-
-        // Get the strings table.
-        let strhdr = shdr_iter
-            .clone()
-            .nth(usize::from(hdr.shstrndx()))
-            .and_then(F::SectionHeader::from_bytes)?;
-
-        // Find the section which name matches `name` and return it.
-        shdr_iter.find_map(|sh_bytes| {
-            let sh = F::SectionHeader::from_bytes(sh_bytes)?;
-            let name_offset = strhdr.offset().checked_add(u64::from(sh.name()))?;
-            let section_name = elf_str(elf, name_offset)?;
-
-            if section_name != name {
-                return None;
-            }
-
-            let start = usize::try_from(sh.offset()).ok()?;
-            let end = usize::try_from(sh.size())
-                .ok()
-                .and_then(|sz| start.checked_add(sz))?;
-
-            elf.get(start..end)
-        })
-    }
-
-    /// Extract the section with name `name` from the ELF64 image `elf`.
-    fn elf64_section<'a>(elf: &'a [u8], name: &str) -> Option<&'a [u8]> {
-        elf_section_generic::<Elf64Format>(elf, name)
-    }
-
-    /// Extract the section with name `name` from the ELF32 image `elf`.
-    fn elf32_section<'a>(elf: &'a [u8], name: &str) -> Option<&'a [u8]> {
-        elf_section_generic::<Elf32Format>(elf, name)
-    }
-
-    /// Automatically detects ELF32 vs ELF64 based on the ELF header.
-    pub(super) fn elf_section<'a>(elf: &'a [u8], name: &str) -> Option<&'a [u8]> {
-        // ELF identification: a 4-byte magic followed by a class byte (32- vs 64-bit).
-        const ELFMAG: &[u8] = b"\x7fELF";
-        const SELFMAG: usize = ELFMAG.len();
-        const EI_CLASS: usize = 4;
-        const ELFCLASS32: u8 = 1;
-        const ELFCLASS64: u8 = 2;
-
-        if elf.get(0..SELFMAG) != Some(ELFMAG) {
-            return None;
-        }
-
-        match *elf.get(EI_CLASS)? {
-            ELFCLASS32 => elf32_section(elf, name),
-            ELFCLASS64 => elf64_section(elf, name),
-            _ => None,
-        }
-    }
-}
-
 pub(crate) struct TlvBlock<'a> {
     pub(crate) tag: &'a str,
     pub(crate) value: &'a [u8],
diff --git a/drivers/gpu/nova-core/firmware/fsp.rs b/drivers/gpu/nova-core/firmware/fsp.rs
index 6eaf1c684b9d..2c212b195ddb 100644
--- a/drivers/gpu/nova-core/firmware/fsp.rs
+++ b/drivers/gpu/nova-core/firmware/fsp.rs
@@ -6,12 +6,11 @@
 use kernel::{
     device,
     dma::Coherent,
-    firmware::Firmware,
     prelude::*, //
 };
 
 use crate::{
-    firmware::elf,
+    firmware::Tlv,
     gpu::Chipset, //
 };
 
@@ -19,11 +18,11 @@
 const FSP_HASH_SIZE: usize = 48;
 /// Maximum size of the FSP public key (RSA-3072), in bytes.
 ///
-/// The FMC ELF `publickey` section may be shorter, so the remaining bytes are zero-padded.
+/// The FMC `PKEY` tag may be shorter, so the remaining bytes are zero-padded.
 const FSP_PKEY_SIZE: usize = 384;
 /// Maximum size of the FSP signature (RSA-3072), in bytes.
 ///
-/// The FMC ELF `signature` section may be shorter, so the remaining bytes are zero-padded.
+/// The FMC `SIGS` tag may be shorter, so the remaining bytes are zero-padded.
 const FSP_SIG_SIZE: usize = 384;
 
 /// Structure to hold FMC signatures.
@@ -38,64 +37,34 @@ pub(crate) struct FmcSignatures {
 }
 
 pub(crate) struct FspFirmware {
-    /// FMC firmware image data (only the "image" ELF section).
+    /// FMC firmware image data
     pub(crate) fmc_image: Coherent<[u8]>,
     /// FMC firmware signatures.
     pub(crate) fmc_sigs: KBox<FmcSignatures>,
 }
 
 impl FspFirmware {
-    pub(crate) fn new(
-        dev: &device::Device<device::Bound>,
-        chipset: Chipset,
-        ver: &str,
-    ) -> Result<Self> {
-        let fw = super::request_firmware(dev, chipset, "fmc", ver)?;
+    pub(crate) fn new(dev: &device::Device<device::Bound>, chipset: Chipset) -> Result<Self> {
+        let fw = super::request_tlv(dev, chipset, "fmc")?;
+        let tlv = Tlv::new(fw.data())?;
 
-        // FSP expects only the "image" section, not the entire ELF file.
-        let fmc_image_data = elf::elf_section(fw.data(), "image").ok_or_else(|| {
-            dev_err!(dev, "FMC ELF file missing 'image' section\n");
-            EINVAL
-        })?;
+        let fmc_image_data = tlv.get_bytes("BLOB")?;
         let fmc_image = Coherent::from_slice(dev, fmc_image_data, GFP_KERNEL)?;
 
         Ok(Self {
             fmc_image,
-            fmc_sigs: Self::extract_fmc_signatures(&fw, dev)?,
+            fmc_sigs: Self::extract_fmc_signatures(&tlv, dev)?,
         })
     }
 
     /// Extract FMC firmware signatures for Chain of Trust verification.
     ///
-    /// Extracts real cryptographic signatures from FMC ELF32 firmware sections.
+    /// Extracts real cryptographic signatures from FMC TLV firmware tags.
     /// Returns signatures in a heap-allocated structure to prevent stack overflow.
-    fn extract_fmc_signatures(
-        fmc_fw: &Firmware,
-        dev: &device::Device,
-    ) -> Result<KBox<FmcSignatures>> {
-        let get_section = |name: &str, max_len: usize| {
-            elf::elf_section(fmc_fw.data(), name)
-                .ok_or(EINVAL)
-                .inspect_err(|_| dev_err!(dev, "FMC firmware missing '{}' section\n", name))
-                .and_then(|section| {
-                    if section.len() > max_len {
-                        dev_err!(
-                            dev,
-                            "FMC {} section size {} > maximum {}\n",
-                            name,
-                            section.len(),
-                            max_len
-                        );
-                        Err(EINVAL)
-                    } else {
-                        Ok(section)
-                    }
-                })
-        };
-
-        let hash_section = get_section("hash", FSP_HASH_SIZE)?;
-        let pkey_section = get_section("publickey", FSP_PKEY_SIZE)?;
-        let sig_section = get_section("signature", FSP_SIG_SIZE)?;
+    fn extract_fmc_signatures(tlv: &Tlv<'_>, dev: &device::Device) -> Result<KBox<FmcSignatures>> {
+        let hash_section = tlv.get_bytes("HASH")?;
+        let pkey_section = tlv.get_bytes("PKEY")?;
+        let sig_section = tlv.get_bytes("SIGS")?;
 
         // The hash section is a SHA-384 output: it must be exactly FSP_HASH_SIZE bytes.
         if hash_section.len() != FSP_HASH_SIZE {
@@ -108,15 +77,36 @@ fn extract_fmc_signatures(
             return Err(EINVAL);
         }
 
+        // The key and signature sections are zero-padded to a fixed maximum, so they may be
+        // shorter, but must not exceed the destination buffers.
+        if pkey_section.len() > FSP_PKEY_SIZE {
+            dev_err!(
+                dev,
+                "FMC public key section size {} > maximum {}\n",
+                pkey_section.len(),
+                FSP_PKEY_SIZE
+            );
+            return Err(EINVAL);
+        }
+        if sig_section.len() > FSP_SIG_SIZE {
+            dev_err!(
+                dev,
+                "FMC signature section size {} > maximum {}\n",
+                sig_section.len(),
+                FSP_SIG_SIZE
+            );
+            return Err(EINVAL);
+        }
+
         // Initialize the signatures in place to avoid building the large `FmcSignatures` on the
         // stack, then fill each section from the firmware.
         let signatures = KBox::init(
             pin_init::init_zeroed::<FmcSignatures>().chain(|sigs| {
                 // PANIC: src and dst lengths are both FSP_HASH_SIZE (verified above).
                 sigs.hash384.copy_from_slice(hash_section);
-                // PANIC: dst is sliced to src.len(); src.len() <= FSP_PKEY_SIZE per `get_section`.
+                // PANIC: dst is sliced to src.len(); src.len() <= FSP_PKEY_SIZE (verified above).
                 sigs.public_key[..pkey_section.len()].copy_from_slice(pkey_section);
-                // PANIC: dst is sliced to src.len(); src.len() <= FSP_SIG_SIZE per `get_section`.
+                // PANIC: dst is sliced to src.len(); src.len() <= FSP_SIG_SIZE (verified above).
                 sigs.signature[..sig_section.len()].copy_from_slice(sig_section);
                 Ok(())
             }),
diff --git a/drivers/gpu/nova-core/gsp/hal/gh100.rs b/drivers/gpu/nova-core/gsp/hal/gh100.rs
index 98f5ce197d13..bb4e191bf1b2 100644
--- a/drivers/gpu/nova-core/gsp/hal/gh100.rs
+++ b/drivers/gpu/nova-core/gsp/hal/gh100.rs
@@ -18,10 +18,7 @@
         Falcon, //
     },
     fb::FbLayout,
-    firmware::{
-        fsp::FspFirmware,
-        FIRMWARE_VERSION, //
-    },
+    firmware::fsp::FspFirmware,
     fsp::{
         FmcBootArgs,
         Fsp, //
@@ -160,7 +157,7 @@ fn boot<'a>(
         gsp_falcon: &'a Falcon<GspEngine>,
         sec2_falcon: &'a Falcon<Sec2>,
     ) -> Result<BootUnloadGuard<'a>> {
-        let fsp_fw = FspFirmware::new(dev, chipset, FIRMWARE_VERSION)?;
+        let fsp_fw = FspFirmware::new(dev, chipset)?;
 
         let unload_bundle = crate::gsp::UnloadBundle(
             KBox::new(FspUnloadBundle, GFP_KERNEL)? as KBox<dyn UnloadBundle>
-- 
2.54.0

