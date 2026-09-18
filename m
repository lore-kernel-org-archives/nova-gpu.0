Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010005.outbound.protection.outlook.com [52.101.46.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75D4F3A963C
	for <nova-gpu@lists.linux.dev>; Fri, 18 Sep 2026 01:08:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.46.5
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789693730; cv=fail; b=NRSv2owx7N4YS1ausIK/m1Ca6E2KoojXMln7z5mbf06UCor19YliYxGin7m2xjJa15OSXncMObVN6M8KYceYXgpAQiJX3FkqFJSidPk7NSa4hMWc759CL456IH+KHFIVtk0xcPEddisc8SnX9oL9/fpDkXZz4SzKQhpxV7zz05E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789693730; c=relaxed/simple;
	bh=z19xIEev/iLH2tMv5dBc7OK7Nc1dVNkXXQRIwW3V/os=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=EdRb3wnG5JPzG9bzcmba5kd2KOQ9rxhKGH5QJANOn85l6eMMR5KYRY+jQ3JAZrSkV1Oldc0eVTRuqxM83yjcilk4bseo7IobCXXWa21QrHheg8JsX7QPhKzDb1igD62Lz5cs0i9HsiHNC+mRwTtjpxxPHuMAdGePIXHPYjLvG4A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=tow7q/8z; arc=fail smtp.client-ip=52.101.46.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="tow7q/8z"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w20dUfvvwvG9IjfeEZowFuEedaez31bQ9r2VrfMnYirrqJAw6D+z6+3DpPN7jMnhswdgvo5mzSs7V//jBIROip/pxtG/vdLt932vaFp4D8F4dUaJhbhwcw9X4FuRwGlrqv772LGSElJ/hbtHHBHim6W0ygF6x91NpFMD4R6KrzNW2g9EAbldkzBs6R3ScM14UfVjwOuG6k0LVpbhMgAbuCcRSMTsft8LcjTt0G7b3i6WmwgSd1sXmkUHSzp8s4x6Tk/CUXXTCUSpJsZKwPoxyTi1CxlLD6U00A6FIQIM4WTWP5Uz6LrnMCxCvNDk85ewq/sCl8x2KQdo1KdBNKDkiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6XDKtF/8fFx5fZjuTvrZQN3codKVUTM8K6Vex+zEtsg=;
 b=dskHDN+Xs+Pa85d1XSfa6x/z3eNsh6RvSQVRQ4DDrXaF6SWadPsDP/qWMWdkM0Tn9ged01jIGbi75v7wVQNvnBKW1M9biE8Tqy6qMwtPBK2Qjcxnb49cUTEJgM/rj8hikGz+ogD03uu5vmuCqoYP2c1xO/MWXDj4vFFNMcZH6MUEIohuLbK3pROYgBfrL39+/BmjmoKuqh60ONkg/W5KF9ALcXzOgZMCcQM291aIwWlNM+Yu5PnLV6hHUMC+xAaKYccWlOBfUD4ZQe9B0zya5o+nYzxmyzetDNJK6pSyLQjRsP6haTOGT1XVWcbfh0qy7U9FQObzx/lmKsWKH3J34w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6XDKtF/8fFx5fZjuTvrZQN3codKVUTM8K6Vex+zEtsg=;
 b=tow7q/8zI7uaZvV/CjvdqEE/dUTFfSfmT+SreuS8cB9s9luak7qHVB9km9th6qSABH79wTY1TCZckkDgl15xggfjeba3QjtE9V6oHL8VdEzAfLxkzRvNKcuS9oFXFaofgQkawNd5JNVqnF0x0Iv0is9BYgn2YkMq/0vEzmM9op7BqExQS+7ID0PXSc46yTV4RvAGYC0TCxxm280uWUwuTvN/RVNeC236Fl06BRGbIVQDnyemzNVRzxKaS55d9pQEec5Lg8ydarQZ4vfCHeUgt5AN/MQ8gTk6AwyJE+5M0hhEhoR5dUsnc4zd4DebNs6HDvU1RLO4XAh/XLvocYX1Ww==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 IA0PR12MB8349.namprd12.prod.outlook.com (2603:10b6:208:407::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.13; Fri, 18 Sep
 2026 01:08:17 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%4]) with mapi id 15.21.0406.007; Fri, 18 Sep 2026
 01:08:16 +0000
From: John Hubbard <jhubbard@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>
Cc: Timur Tabi <ttabi@nvidia.com>,
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
	LKML <linux-kernel@vger.kernel.org>,
	John Hubbard <jhubbard@nvidia.com>
Subject: [PATCH v3 25/33] gpu: nova-core: gsp: let the GSP HAL load the generic bootloader
Date: Thu, 17 Sep 2026 18:07:11 -0700
Message-ID: <20260918010719.1176945-26-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260918010719.1176945-1-jhubbard@nvidia.com>
References: <20260918010719.1176945-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR10CA0017.namprd10.prod.outlook.com
 (2603:10b6:a03:255::22) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|IA0PR12MB8349:EE_
X-MS-Office365-Filtering-Correlation-Id: 3d832389-7585-45ff-5c4b-08df152145b4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|376014|7416014|366016|18002099003|22082099003|56012099006|11063799006|10067099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	etht0gQebnqAoH3zC/TBXvw0aFtYAmuEEVboOMhv+sPO8SgaW1DYKftKPB+Xn8pjG/lbzpwVeeyst25JwdDZ3VhtXTdoTDSnRxcdXLg0IookBxqrNrP/uHBHif/+9/6t7UkwDBZBh6VD0HXUtETrPrssdjzrNugx6dhmgPQtjuL5tD52p57Qxz9EP8NorTDoQTcPYFJhwJl/vQssqwUksHvKGRs30hJi4JQEcSBBPoak90f7muzYomIp5vWycBrSfLQzBtdhAS/n2eLbBHES8+IVeECraaVstj6+ARHpdNSpL+O8xlXUF8PS38Ofa/HTS8SeL/Scdzvdv4uglI++QJ4kKhIS/tEC22dHKloYMDuYeMUqDO8Lz40Jrsq+17LKqNRKmnx+04enWXx1sLcS3s85aRtZ7Pp8PbfHya/JwxoD0rfpgFWdDzJ9QFKyxq4rg3cBAc8uy5q2OpeqJBqEDGKKgaslD83pZaRxPyPlJjmt5ay0hJgV4KCfJc/jkTLoxn/oVVU14nDvUbby0DU/Tc0jJOFIvfe7m2FvBvGZU7LHHCF5wStqEWOL74ypMAzJHuyxBuhJ1cuNGQobmFYwQyzZ8tR/MhTmgTZP4nfMrO0UTgnXPBkdphPMyC32j6GK+jq8eLLxPrVc8/KVaG4qU5hJ3Mc7MhI9PQ7j96ansUA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(7416014)(366016)(18002099003)(22082099003)(56012099006)(11063799006)(10067099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?7FgoSFd2uRt0U3IdJiU6yWaqj/tq2xPCaboQ2MThRs6ldneZbVxGpobnBkdI?=
 =?us-ascii?Q?yao3g8oB+ohTIaMnEbBtKZFJQyzmnQmS+jsFFOjTam27K08iLGFRR9lnkD7f?=
 =?us-ascii?Q?M6EULkFH9u51twW1pMa7HSUfD7t1BQt9E8zmUBs96qSOUF4b2v+Y+MiNwVke?=
 =?us-ascii?Q?nOmUpiy89wudB/PVqXCJgA/Sgabg5kZujXZED+jDDO8hIs1FxTPOpxFuaxr8?=
 =?us-ascii?Q?0zjMwmg1/tOxrFYEBpt2KBMPlG20GChsFhSh0pZRf9UXeYed3zg6/ttITbuB?=
 =?us-ascii?Q?RH5fnmdbMhHOPgyIUno1sOUq7KCASmPx1umjFKAc5nPoHQwdB2AJq1bAXkBP?=
 =?us-ascii?Q?GpGZwNjZN8Eq1IvkdobscfHsstYZ4oUqPjYoVQLLI78fWM3YwBN/muura94Y?=
 =?us-ascii?Q?wJY70JDSem8Lj60ACvSLJ78jC2DE+ZW+pGLCA5lefPdrmYEOYXMSpiV7Ktow?=
 =?us-ascii?Q?G01PR544zhw1zJ6NaWE/FIdfe5r3jzQh3MipUBOwUZekafl9IJYLAgKD6OAi?=
 =?us-ascii?Q?DznrsznTfYyDNSgfHauyduQU476MZitEOPe6UCMHEDAgrbRGhhj1LgDBFprF?=
 =?us-ascii?Q?q5xfCQEUH+SKg6ZLY47AmjDPQ3vYeCPe7NKco6c+wspJkTraxy/i9HtZU7W1?=
 =?us-ascii?Q?7QweHyuIzaduAzRSkd0f6oFlOnAJF+wVOs9NKf6vLV0wk7thEsbTIck1+N8R?=
 =?us-ascii?Q?NGPFYcPyE46wBWOfNTcfvK5jH99kB4ylYpPOASOr6KHXeuhCrTMq5j1AvW3t?=
 =?us-ascii?Q?6mXOBvsMWVv4/5F3M33aprUWg0mszVVfThfP2Lc6rrLRQ+5QAr0puIV/gxM6?=
 =?us-ascii?Q?B6HWCxLUk60ZZ1Tfuu073xaCxZFyyrKoYquY/3MaPJi3Iugwj5q3Y4vrRkgt?=
 =?us-ascii?Q?zM07xAZcczfyzo0o+rdLkHoEv8drHoQWaeK6r2glc9kU1lciNBAs8H5b46yO?=
 =?us-ascii?Q?Uqq7Wc7k/knxeAgPxat9f96djevXn126KQ5AF8fRKXJ5O/lRiIqzGFWetTtO?=
 =?us-ascii?Q?w2W9A4DjsG70+4bdZudYx5CSv6xhZ/cD25lb58XJIchDB/juoI30bB399z3r?=
 =?us-ascii?Q?d03k+ylOCC6dOPN7/P1H9n1NmwguVAKBZ/lG7rHMmHvrKfwGAL44s/+YgB9V?=
 =?us-ascii?Q?alipBwXdyHzE0DEGX4BSVBgvdwrMv12ys/+p+RW2HTLRuskWpQKR8wKN+IFr?=
 =?us-ascii?Q?FzA+ptaW3yEi1Oveh0ucg6++Tu0RH4KC2HMVnGPeBoGTDEAeDBrUtGvUW2WY?=
 =?us-ascii?Q?hxa+6xEbO5VtD0sQHmVnNJzkEh+hOII5g/Rw1ElsPQ5HHwYnf/c40e5EAWON?=
 =?us-ascii?Q?N7XPT9dOktHC7otp2lkzCbaQfSo4A1ja2YVa3+rzG01ECvu7TbJSncdIcmRb?=
 =?us-ascii?Q?N+Dr9E76I10T1VDcNk+ay+Z8KpiqFTq5jNX7ykbRluirlA/bmv79h3VNJ/+N?=
 =?us-ascii?Q?BFBS0X9P7crT1a5TG1V2ZwhO7pmR4isynuGuyee+jZXxqCIDZBBtWjCqu++x?=
 =?us-ascii?Q?tWHbt+Tr2IYPlGNwzRyMOP9E/6+47nx1pETzCU1rS+UwQPhlp/kIlS+JlYBJ?=
 =?us-ascii?Q?nqcJGIOrRL7dGVsa74uzYALjyFOI8lXy3mkg7+gxCtpMpJbKfDL5LIQZmFv5?=
 =?us-ascii?Q?AeMIXog5Kk+Db9wRqfmamzB69clvmgyGrXoumAgD7uYo+u14XSrScxUarUQd?=
 =?us-ascii?Q?dRvLEdvkozFcwh2MAMRTJLaPn3sydcOu3+sfthrpYnJRtkKBud+asA8fli3b?=
 =?us-ascii?Q?7UksvnEbyw=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d832389-7585-45ff-5c4b-08df152145b4
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2026 01:07:55.8790
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qE3vAHJvoIZkVT44RISYsKHbjrp10JeeK8/LVfAza54yhtAB43kBovE4nSxTNQIodItv2RnxPKKyHzebeg4Msg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8349

Turing and GA100 boot the GSP through the generic falcon bootloader. On
those chipsets the r000 GSP-RM raises a load-and-execute event that
requests a bootloader run, and the handler for that event runs the
bootloader that the boot sequence supplies. Whether a chipset boots
through the bootloader is a property of the TU102 HAL: a field of its
two instances, set for Turing and GA100 and clear for the other Ampere
chipsets and for Ada.

Only the TU102 HAL tested that field, to choose how to load FWSEC. The
boot sequence had no way to obtain the bootloader for the handler
without a second list of the chipsets.

Add a HAL method that loads the generic bootloader. The TU102 HAL loads
it when its field is set, and every other HAL returns no bootloader. The
method has no caller until the switch to r000.

Assisted-by: LLM
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/gsp/hal.rs       | 28 ++++++++++++++++++++++++--
 drivers/gpu/nova-core/gsp/hal/tu102.rs | 14 +++++++++++++
 2 files changed, 40 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/nova-core/gsp/hal.rs b/drivers/gpu/nova-core/gsp/hal.rs
index d8329f6fcc65..8c2a8abcb187 100644
--- a/drivers/gpu/nova-core/gsp/hal.rs
+++ b/drivers/gpu/nova-core/gsp/hal.rs
@@ -5,10 +5,16 @@
 mod gh100;
 mod tu102;
 
-use kernel::prelude::*;
+use kernel::{
+    device,
+    prelude::*, //
+};
 
 use crate::{
-    firmware::gsp::GspFirmware,
+    firmware::{
+        gen_bootloader::GenericBootloader,
+        gsp::GspFirmware, //
+    },
     gpu::{
         Architecture,
         Chipset, //
@@ -42,6 +48,24 @@ fn boot<'gpu>(
         gsp_fw: &GspFirmware<'gpu>,
     ) -> Result<Option<super::UnloadBundle<'gpu>>>;
 
+    /// Loads the generic falcon bootloader for the chipsets whose GSP boots through it.
+    ///
+    /// The bootloader runs from the last blocks of an IMEM of `imem_size` bytes. On every other
+    /// chipset this returns `None`.
+    ///
+    /// # Errors
+    ///
+    /// Errors from loading the bootloader image are propagated as-is.
+    #[expect(dead_code)]
+    fn generic_bootloader(
+        &self,
+        _dev: &device::Device<device::Bound>,
+        _chipset: Chipset,
+        _imem_size: usize,
+    ) -> Result<Option<GenericBootloader>> {
+        Ok(None)
+    }
+
     /// Performs HAL-specific post-GSP boot tasks.
     ///
     /// This method is called by the GSP boot code after the GSP is confirmed to be running, and
diff --git a/drivers/gpu/nova-core/gsp/hal/tu102.rs b/drivers/gpu/nova-core/gsp/hal/tu102.rs
index 1b17ece53bd6..32931fd0b7cf 100644
--- a/drivers/gpu/nova-core/gsp/hal/tu102.rs
+++ b/drivers/gpu/nova-core/gsp/hal/tu102.rs
@@ -31,6 +31,7 @@
             FwsecCommand,
             FwsecFirmware, //
         },
+        gen_bootloader::GenericBootloader,
         gsp::GspFirmware, //
     },
     gpu::Chipset,
@@ -316,6 +317,19 @@ fn boot<'gpu>(
         Ok(unload_guard.dismiss())
     }
 
+    fn generic_bootloader(
+        &self,
+        dev: &device::Device<device::Bound>,
+        chipset: Chipset,
+        imem_size: usize,
+    ) -> Result<Option<GenericBootloader>> {
+        if !self.needs_fwsec_bootloader {
+            return Ok(None);
+        }
+
+        GenericBootloader::new(dev, chipset, imem_size).map(Some)
+    }
+
     fn post_boot(
         &self,
         gsp: &Gsp<'_>,
-- 
2.55.0

