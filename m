Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010040.outbound.protection.outlook.com [52.101.61.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35CEF364038
	for <nova-gpu@lists.linux.dev>; Sat, 12 Sep 2026 04:44:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.61.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789188269; cv=fail; b=JsQnshl8ZB88WTo3KAAhsX+5Zfr98UXU8HMXuPaNQSlXQVtdGgl0PdvKk8grKEM97BZKJ0W3wdMcB5D0+aUUyglZo7fVqmWms5j5Gt3H/octx20EVgDoU+f/qv+z4VOnTsM0/e2b8W4cLHyYB4KgaOSqyYiMXcSsEPv8eNS4Ogw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789188269; c=relaxed/simple;
	bh=AfoCtmKgy1dPSDaP9xjCArQE8CGgZsEGwTpD8JEYSdQ=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=gDmgByuX26/UklOjMSerruboAeHQ66DKX0wkk08pS3dy09JRYC9VVSwTKkqSHXX5uz/zY3Wiwru8phNTNUf3GANOluIfFkvi/Jb/uhqLJwVW/DkoSPblN4ZknanY5zOEycdp4VHGJLDOnqwgUNMq1TT0/RGhk9oljYaLLUFkthI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=hZ2kGa/d; arc=fail smtp.client-ip=52.101.61.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="hZ2kGa/d"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FOvRt3WSTsE3BZ93/CQEFXtWjWa+1rm1rWcZGH9MO1X3O+pRxzRd2j75uBf77t2FOaSzrHY6lfHPN9H9VOJfHXR/1cun2ylfnV1S+9lceRbc7lTmg8kO+5qWgmly1GpCpVSSvbUjvmYxkk5DlOxqywIH3ga9CWNRCvCSzqckBo4xqLC5oLHufjbCXjIAje5w3NDqCugFBHN1RI775MbLdjcq/E/Rv81aIDILBcX09EngVjIJC5BWUeVm0sOnawnCqukgMyCE0bIJq2JFEV5Itvaj4ZafBs9fIW/0pCRrcz71PN02jiDtUObOTvMkCNqJP4ccgyun9Jk7LPImUAQ1GA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5XOS0pEOf9TmoooMJGqYJ0UKC2WZ5u2K6cAYQkUuiJE=;
 b=HBrLK54PpARTB3IilTY7Q+eQ+NswV3JCLVjSO2nv3e51ogmboKD4W3dACN81IhkT8qMly+3O7JSF3CsmIlDfiPrMxGEgA/PHjdePT9RwS48SygKyWL32AWG9+Nvcu+II4lmu3MKOXrpNW5+FSx1j5PyFZnhIq8xITcyFfsG9z2YUT6xrQEpo0vj1RQghcekur05MEvff9xKQSSx9uIaZR8OswtO0sphf5Ga6X2Q2MnJ9OZQzNwMeG/NeatMx+tLDOsPEtrGzmIYigiH9kjw8YPn9vU1G+SkRHg7TETq0LIHyIU1r2SC3ioOHDZfdIptoHkE8O0JzaSGBn2BVb7efUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5XOS0pEOf9TmoooMJGqYJ0UKC2WZ5u2K6cAYQkUuiJE=;
 b=hZ2kGa/dn7nbIxAsOfqdtLzEcRaTDieO8+m49tLZmNsjtFPFGCBy/sHR8w/8hd3Yc4qF+Z3qNvaiaG4n2ED1E/shxC94U3dA2q5W0XpCECrRZ2vJBZtJxGhlWtqnT/yUD6PAJ4119iepjt5OKGezCHOUyZsYdMZ9VUo6q1myZshYTpN0eXJKRuu9PCQn+GE6ezCSSIlTNjBsTnTnsH1jvvIVGrZPVy6Oi5J7h3QNqNgnWhDUmU7zw0n9MijNY2Uhybzy90WQLRYWg1mIk8U6XIm4QGtuITmt8xjfznG6e07REI2x0yZ+5DvwMNRis3SthxdEsdgXyIUvJ0TQ851akQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 PH8PR12MB7229.namprd12.prod.outlook.com (2603:10b6:510:227::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.10; Sat, 12 Sep
 2026 04:44:15 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%4]) with mapi id 15.21.0406.007; Sat, 12 Sep 2026
 04:44:12 +0000
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
Subject: [PATCH v4 00/17] nova-core: GPU interrupt support and GSP event delivery
Date: Fri, 11 Sep 2026 21:43:43 -0700
Message-ID: <20260912044400.677097-1-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.55.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0162.namprd13.prod.outlook.com
 (2603:10b6:a03:2c7::17) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|PH8PR12MB7229:EE_
X-MS-Office365-Filtering-Correlation-Id: 201caa26-4b2b-41ae-7e5f-08df10887dcf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|23010399003|366016|10067099003|6133799003|3023799007|18002099003|5023799004|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	pqG3Ssy8G/JaDbRrdfA4P1ZipilAwSCRx7WRivdp4arn8t6czsGwb+fJba4bSGsGEyQV1ONvUd8YOLurDqEF+Mq0LE5OGgsrj4JCKoaMsfQqX8K6rKYftjWaPFAzC5UQk2qhGANVr4kghSN+fXz2vnBTCgBHOwmh0lAnlKUw73xZEk4mwk9uMrSC4qfRFoSd6ExVqOjhsEiRDZmWjVaRYorZFPCFzg2p7rIUaCkEgMIoekeGsBdCbciRdcDmKtMS2JaW4CGUPBLAjY4d8xEd3zBGCqmrYJT2iucxTiNRfulFq7TARFU5OTYcHdaXRlj72rFGREfI8qwFaFxsXYMp/y2rOm5nvkTfW3s0/nTCbprxPJgXLWzEPMglPZiJGm/CVa2MZW9VNd+agmAwetU0MeICxTTGGxlzWAFvRgpLrLx3NW6GqGncCcD76VxaHlM8tqibye/RmKyXapH4BV9B2A+QrRyTxDss3g5Zy4W9L1AkIqNPN1oDxo4UreFvQ5bo+rYZm/MujZ71SkifO0AdeHDb2INkqYVqr/qRvsr4AFtqXZG0iIT8DwleKFt3Z88B0X9MZnUZ7orFbSe/FVwnPAXWvDgFrf/yJDir/9eqruw5EhieQK07V98TZZhKp89h31TTFoHzRsGT/f8gfiENDCK4Ij0xAheM9nUJm7S+Jds=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(23010399003)(366016)(10067099003)(6133799003)(3023799007)(18002099003)(5023799004)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?fP+BUz1v21+zzrxCTudZptZ/8jN31477eeAXdD7BTlkQly33g3x+oVGztQAc?=
 =?us-ascii?Q?FSZsanBF3PgQbWzp/KCG2/9UREOazCskuojxdS//LHaqZ8JbLWuhndxCEb0O?=
 =?us-ascii?Q?YxJZR/XsJFUVd98/g8bntHtPrcvDvzO/Oje5d1nEEinDAdxcPoHnyuvPQywd?=
 =?us-ascii?Q?BC6KYh8dEF/eywi4gpZxutUgkvfthVvqoE7IeMggt3KVPZnMcwvVenD4urBY?=
 =?us-ascii?Q?eOyxGFqWkozATVikNAu5Be8AEjtETzPn5WwGhytdaISSx28O7vim7arnAwl3?=
 =?us-ascii?Q?d4Biesg0awdrAkSiPahh5ZlflkcAYi7UJxAUFQow5dxIHBZroqkOcbT/PoxB?=
 =?us-ascii?Q?rEHKQE4BJlNAbrWn+9eaxFS3cFX2VxxWWDhJyiMbX7YK2l5G5ffzDoPFN6z/?=
 =?us-ascii?Q?3HbaPcLvmCmhbQfL+j3FcaLzo3wcKNMJrQaVJeMk3KgSnrlAlqyN0DvgCPKL?=
 =?us-ascii?Q?2qKIV1gFWJlkfdAOZ1DJvAr7l7g/OHaAK75HnXDsRJezBlIs4Wkkt5apmhOJ?=
 =?us-ascii?Q?9+XHNrgrMvXARQJSISaRdG/Nhwwy+K36HkA4PTco00CjjnTCv0lL7lPZBS7s?=
 =?us-ascii?Q?sPZIKeoLDOrVYr3mPdBHdrTUHxks0B/FFZCjQ5OJblKxAnb8nnBjw460QX7J?=
 =?us-ascii?Q?i5c4cJzIRUG98+uGWATAXo1VL1Q3EBbfhuPvaRgu/kH8csfLJ4LPSbk+HRRS?=
 =?us-ascii?Q?3qqIG099z/gjdaKFNtR+mpR6Jlq7I8uBa/o18k39rxhJP2okFzg6Nj4Untsq?=
 =?us-ascii?Q?QQ3buT9k4bb4uIauyLtW1zbW1drcbXOYjWfFC4OQq+neElA9XHQN1qZwdwAy?=
 =?us-ascii?Q?pvdY9v9st03HKLRlSsb4DynbQpdShtFWskXrq8924ULXjlwtFQw7g85WmIGL?=
 =?us-ascii?Q?lrZo3fdGBMo5Y+8iVfO7EOmRa81E2KJYFWkqZaRhP/A6dliUIZqlEmSpIenT?=
 =?us-ascii?Q?oKOV0Nmjc19LCBicIl1MtlSbms08vr/BqeUCct4JqjFDXVqS8DyNJNelMwTr?=
 =?us-ascii?Q?Nkv3iGPMJG7uAieTXu9NO3AG2hG6l6z9LNES70NGlMMD2Pyy4xYrCKnpZ0u9?=
 =?us-ascii?Q?BGD4hZxza3tUd7TiDdp0jVNANAGwF63miHTaW5IeTGXX3X66sxSwy1XQqkQu?=
 =?us-ascii?Q?y/HFnZMews3ZnaQHwIwngnBuJ6utyFnGvg4jTSJl/bvAVJ5M2uoOXwVn1ov6?=
 =?us-ascii?Q?6te5Oh6oI4lJv8lAUZHjQ3TeLV1jefNNtADJWAb41KCmXzqG1n46A9bfeXkI?=
 =?us-ascii?Q?rhQ9zn3DOJe+iSjndTi0IeiDRUWFdmOKUOvJzL89rlV0YQH5sPMqodJqcxFj?=
 =?us-ascii?Q?PsjGAyopgPEj9eQx+qCMw93nIkl1VFqmr2ukPog8ksGPUUxl2EhsXGFfkVow?=
 =?us-ascii?Q?XkcQ5WhwzEmdl6kKuL0ISEj3AElRGybGachtXKkGtPlonfU4hjfc3mzV2jZD?=
 =?us-ascii?Q?PDdXrGZShKRrwYgvgu/2ef2QB+DqQI7xiyqZV7RVpwrhgF4x20FdqsdSNcHL?=
 =?us-ascii?Q?yPwV9DFDQrkkR++aqtx/08us//VoE1oFpE2mMohx4R75Rr+tdejR9GPRJDuV?=
 =?us-ascii?Q?KVuGn8HSLo2LMh37KTnZU545b8xMLuvqhgHxsM6v4cmsgD50LXTmR+f2b5QT?=
 =?us-ascii?Q?dI6c6jxnCaZ8e4ep+CbqDKoDuHMjCdahelKOEc7COoHgVyjKWQk9scZf4Xe0?=
 =?us-ascii?Q?WiHH8WHup15mstWyV7x66sGQOEJhiswTFSV6arpmI1Ov6T6Jr8/wejSj6RTC?=
 =?us-ascii?Q?jlnyZxENSg=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 201caa26-4b2b-41ae-7e5f-08df10887dcf
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2026 04:44:12.5404
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: u1dXBptwCH+PSB3Gvp/oKCcCKJPLDymsaZoJ84VPrC42OVvBICzEcrnjly+3jo9R8WXuWHOoloJyq/gU3xIkpQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7229

This series adds support for GIN, the GPU Interrupt and Notification
unit, which is the GPU's interrupt controller, so that GSP events reach
the driver as interrupts rather than only when the driver polls for
them.

The handler is threaded. The top half touches only GPU registers, and
the IRQ thread drains the GSP-to-CPU message queue.

This is based on drm-rust-next at d669686f8170 ("gpu: nova-core: mm: Add
BAR1 memory management self-tests"), which now includes the PRAMIN and
BAR1 memory management series from Joel and Eliot. The PRAMIN series
brought the NOVA_CORE_SELFTESTS option and the assertion macros for
probe-time hardware tests, and the interrupt self-test uses both.

Patches 7, 11 and 13 are new, so v4 has 17 patches where v3 had 14.

Changes in v4, at a high level:

* Rebased onto the current drm-rust-next.

* The comments, doc comments and commit messages are rewritten across
  the series, and the design document is reworked.

* A GSP fault no longer hangs the CPU. The top half reads the falcon
  causes back after clearing them, and disables the GSP vector instead
  of retriggering the falcon when one is still set.

* The self-test allocates its own vectors and runs from probe, after
  the GFW boot wait, which a new patch moves out of the Gpu
  constructor. It shares the NOVA_CORE_SELFTESTS option and the
  assertion macros with the memory management tests.

* A GSP message of the wrong type returns ENOMSG instead of ERANGE, in
  a new patch.

* Three pieces moved out of the SWGEN0 patch: the GSP queue drain to a
  new patch, a SubtreeSet method to patch 3, and the falcon interrupt
  HAL to patch 14. The SWGEN0 patch now carries only the handler and
  its registration.

There is a git branch with the patches as applied to drm-rust-next:

    https://github.com/johnhubbard/linux/tree/nova-core-gin-interrupt-tree-v4/

The branch also carries two small bindgen warning fixes of mine below
the series. They are not part of it.

Changes in v4, in more detail:

* I rewrote the comments, doc comments and commit messages across
  patches 3 through 17, and reworked patch 17's design document.

* Rebased onto the current drm-rust-next. Coherent DMA allocations are
  tied to the device's bound lifetime there, so Cmdq and Gsp carry a
  lifetime parameter and the GSP event handler borrows a Cmdq<'_>.

* Patch 6 has Tree::new() take a &SubtreeVectors, rather than the MSI
  type and the serviced subtrees that its callers were unpacking from
  one. (Alex)

* Patch 7 is new. It moves the wait for the GPU's own firmware from the
  Gpu constructor out to the PCI probe, so that patch 8's self-test can
  run from probe as the memory management self-tests do. The interrupt
  self-test runs after that wait and before the GSP boot that the
  constructor does, while the memory tests run after it. (Alex)

* Patch 8 uses NOVA_CORE_SELFTESTS and the selftest_assert macros
  instead of its own Kconfig option. The memory management tests and
  the interrupt test share the option but not the failure behavior: a
  failed interrupt delivery test fails the PCI probe, while a PRAMIN or
  BAR1 failure only logs. The option's help text says so. (Alex)

* Patch 8 also allocates the vectors for the doorbell's own subtree and
  releases them, instead of borrowing the driver's allocation for the
  GSP subtree, which worked only because both vectors are in subtree 2.
  It registers as "nova-core-selftest". Every supported chip has the
  doorbell at the same vector, so the test names it without asking
  GSP-RM. (Alex)

* Patch 9 renames classify_event() to log_event(). The function only
  logs, and never returns the classification that the old name
  promised.

* Patch 10 warns when a GSP message is too short to decode as the
  expected type. (Alex, Gary)

* Patch 11 is new: a message of the wrong type now returns ENOMSG
  instead of ERANGE, which says nothing about a message. Two retry
  loops still matched ERANGE, so the patch converts them to keep GSP
  boot working. Patch 12 removes both loops. (Gary, Alex)

* Patch 12 refactors the deadline loop into one place, and drops a
  reference to a private method from the public documentation. (Alex)

* Patch 13 is new, and carries the GSP message queue drain that v3
  added inside the SWGEN0 patch. (Alex)

* Patch 14 carries the falcon interrupt HAL that v3 put in the SWGEN0
  patch, as a HAL now rather than two functions matching on chipset.
  It is separate from the falcon boot HAL, which the top half cannot
  reach without allocating. (Alex)

* Patch 15 fixes the interrupt storm. IRQSCLR does not end a cause
  driven from outside the falcon, so v3's retrigger re-emitted it at
  once. The top half now reads the causes back after the clear, and
  disables the GSP vector instead of retriggering when one is still
  set. (Sashiko reported it. I have not reproduced it.)

* Patch 15 also returns the host-routed causes as a typed IRQSTAT value,
  and replaces the module-wide expect(dead_code) with a per-item
  cfg_attr on the items that the off-by-default self-test leaves dead.

* Patch 16 tests both falcon interrupt properties through the new HAL.

Will, I kept your Reviewed-by on patches 4, 5 and 6. I dropped it from
the rest, because the comments changed everywhere and patches 8, 14,
15, 16 and 17 changed in substance. Patch 15 is the one I would ask you
to look at first: its top half can now disable the GSP vector instead
of retriggering the falcon.

TESTING: to fill in after the test run. v3 was tested on Turing
(TU117), Ampere (GA104) and Blackwell (GB202), covering probe and
chipset identification, the interrupt self-test, a GSP name query over
the command queue, driver unload/reload, and the KUnit suites. I have
not produced a GSP fault on any of them, so the new fault path is
untested.

Joel Fernandes (2):
  rust: sync: completion: add wait_for_completion_timeout()
  gpu: nova-core: add the GIN interrupt tree and allocate its vectors

John Hubbard (15):
  rust: pci: declare IrqType and IrqTypes with impl_flags
  gpu: nova-core: add the GIN vector, leaf and subtree types
  gpu: nova-core: add the GIN CPU interrupt tree and MSI EOI registers
  gpu: nova-core: add the per-architecture GIN CPU interrupt HAL
  gpu: nova-core: wait for GFW boot in probe, not in the Gpu constructor
  gpu: nova-core: add an interrupt delivery self-test
  gpu: nova-core: log GSP events instead of discarding them
  gpu: nova-core: stop re-parsing a bad GSP message
  gpu: nova-core: return ENOMSG for an unmatched GSP message
  gpu: nova-core: bound a GSP wait by a single deadline
  gpu: nova-core: add a GSP message queue drain
  gpu: nova-core: add the falcon interrupt registers and their HAL
  gpu: nova-core: service GSP events from the SWGEN0 interrupt
  gpu: nova-core: add KUnit tests for the interrupt tree and HALs
  gpu: nova-core: document the GIN interrupt controller and GSP events

 Documentation/gpu/nova/core/interrupts.rst  | 674 ++++++++++++++++++++
 Documentation/gpu/nova/index.rst            |   1 +
 drivers/gpu/nova-core/Kconfig               |   5 +
 drivers/gpu/nova-core/driver.rs             |  18 +-
 drivers/gpu/nova-core/falcon/gsp.rs         |  73 ++-
 drivers/gpu/nova-core/falcon/hal.rs         | 124 +++-
 drivers/gpu/nova-core/falcon/hal/ga102.rs   |  21 +-
 drivers/gpu/nova-core/falcon/hal/tu102.rs   |  36 +-
 drivers/gpu/nova-core/gpu.rs                |  85 ++-
 drivers/gpu/nova-core/gsp.rs                |   2 +-
 drivers/gpu/nova-core/gsp/cmdq.rs           | 260 ++++++--
 drivers/gpu/nova-core/gsp/commands.rs       |   8 +-
 drivers/gpu/nova-core/gsp/sequencer.rs      |   8 +-
 drivers/gpu/nova-core/irq.rs                | 149 +++++
 drivers/gpu/nova-core/irq/doorbell_test.rs  | 266 ++++++++
 drivers/gpu/nova-core/irq/gsp.rs            | 236 +++++++
 drivers/gpu/nova-core/irq/hal.rs            | 154 +++++
 drivers/gpu/nova-core/irq/hal/gh100.rs      |  28 +
 drivers/gpu/nova-core/irq/hal/tu102.rs      |  28 +
 drivers/gpu/nova-core/irq/interrupt_tree.rs | 625 ++++++++++++++++++
 drivers/gpu/nova-core/irq/regs.rs           |  87 +++
 drivers/gpu/nova-core/nova_core.rs          |   1 +
 drivers/gpu/nova-core/regs.rs               |  69 ++
 rust/kernel/pci/irq.rs                      |  68 +-
 rust/kernel/sync/completion.rs              |  23 +-
 25 files changed, 2905 insertions(+), 144 deletions(-)
 create mode 100644 Documentation/gpu/nova/core/interrupts.rst
 create mode 100644 drivers/gpu/nova-core/irq.rs
 create mode 100644 drivers/gpu/nova-core/irq/doorbell_test.rs
 create mode 100644 drivers/gpu/nova-core/irq/gsp.rs
 create mode 100644 drivers/gpu/nova-core/irq/hal.rs
 create mode 100644 drivers/gpu/nova-core/irq/hal/gh100.rs
 create mode 100644 drivers/gpu/nova-core/irq/hal/tu102.rs
 create mode 100644 drivers/gpu/nova-core/irq/interrupt_tree.rs
 create mode 100644 drivers/gpu/nova-core/irq/regs.rs


base-commit: d669686f8170c234edf12212fac9180ea18b1448
prerequisite-patch-id: 2e07fc4124e1e822f2a4eedf3e814f7e438a6afd
prerequisite-patch-id: 826e07a6bce50fa20188b01e9817fac0c7b6797c
-- 
2.55.0

