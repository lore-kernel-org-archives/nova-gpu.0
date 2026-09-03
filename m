Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010058.outbound.protection.outlook.com [52.101.193.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A983A31F991
	for <nova-gpu@lists.linux.dev>; Thu,  3 Sep 2026 03:15:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.193.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788405326; cv=fail; b=WlJsk95VMI2JzmqSA+54tQiwNvaeQuPWvsv2Yvah3OzyQNnIVj2owjB4bRobMxXOh+Zzb6VXqpbqqq9XKBmC/v0XsX/PMs2fTAm7OvHw8/u7I20RD3HV81Bk5syLrcNzKGBdj/9gjdti5pRTKvA0JIqXWNwz6bZus8NfoD93CgE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788405326; c=relaxed/simple;
	bh=iHhMO+ilO+wgA6x6T/KiphI01eiwsFDjaJbGQSOk5oI=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=ZuQ8Owpf1FNJOPvqfrU1qFgATVAKkeInA20TK+4IKyiXeTncbFWlf7xtqSf/+DmwgGp9eeZlPG5Rhho8F8AH6/IdPsJkCjg5IWXY7DeFc1iHaQHTVgyMIq4vC8w7L83AIen0P4XPaL+BVrri/LMehCovHEZxE7cjEY+MDN4rQZc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=YVdbh3EY; arc=fail smtp.client-ip=52.101.193.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="YVdbh3EY"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BDoDacr8R5KggtQctkylMZ1i5C02XNV1F6+ariImh0ku3/DzvB30u6aGmqsCP43Lk3RyoWXwJsEcr2cZ2V68WALtXvSkR/Se3vYQVnDB6cPqiXsBCsGdfhRrcm+GqeSXkTQLgk1shPRW9NS63KGiKtPIrxejSvyUgoenKrQSueB1ZWmZIzm8MK57D3eR/CR+WzU6CkVrfC8zAZyfjIHyRbmKAgBGfM+fBNqcbxRkUyk/gWN0vOiXlR+wu5f6FRLbB7kXyK3DQc2tA0nQ+Me4/XZ7A7V/T9bjanJ8UhVn1Px4kBwgWmgTN8krrXCCdXkSrxT83UEzNoMemu/TreJgMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SqiyPIrBMLuqMlQf5DTYwsVTQnAlo8vup46IatUcPto=;
 b=p4IXz4JWqNT2PVXpvPyVCWK5IM573jpD5xeJ848FwtcFZi79nnNsjqZCXIxdiM8lrA7iiVNr9OAWFdOTqr0jeLK47Lb2BXVV2Da2kYI+VAEfM8L4IWXnnYTdl79Ah4V0ioHw3L7DSV2sSfGwnY2OQTRjHO/DaTgSk5sw8d5f+4g2/CYLIsuUkI1Dqrv3lSreUrKB8qo+V0SQCY++5fGyXsEi9tAyJPkhred6/oW6z4ws2CMTQZSy8Fv/7Dr1dAX/EaGYZsMzeAlwxS40kZnofL30EcQ1ineEK4psvNCXZMqp8/sAZrNZf92bcf+CUbB3xiworQFcuEL5njkfSJZAsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SqiyPIrBMLuqMlQf5DTYwsVTQnAlo8vup46IatUcPto=;
 b=YVdbh3EYvjAPI1kDHXQBQB0KJkriOk9L//d4qvO9AJQj1KH5bwgDe7/gju0pOiZpGF4OuDUr70uiUf1+vgfogTD12dbFxQeki9J1jKDuOTl+5NHkVEeSztCPqErlHdKzExpJsMKZmP3VcIYZbgHa+xouGYyT+kEJ45WqZ9LoqnahhKbF5ZAbbdYKx+0fpy6dIIacCpRX4J5I7lYZ4hFCBF18O2BV5Rn4bSkA5aokPF87Oax7asw/UkCa7f4QKGav6VsnEK4hQvw/BpdWZVmhl/uRP4AVAuAffxUIYUFVQQ3yliw69tPoxex535Q43UzqhncR5ykg8KWTeOey+GLn+Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 SJ2PR12MB9138.namprd12.prod.outlook.com (2603:10b6:a03:565::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.360.13; Thu, 3 Sep 2026 03:15:19 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%4]) with mapi id 15.21.0360.008; Thu, 3 Sep 2026
 03:15:18 +0000
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
Subject: [PATCH v3 00/14] nova-core: GPU interrupt support and GSP event delivery
Date: Wed,  2 Sep 2026 20:14:59 -0700
Message-ID: <20260903031514.1515905-1-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.55.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0101.namprd05.prod.outlook.com
 (2603:10b6:a03:334::16) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|SJ2PR12MB9138:EE_
X-MS-Office365-Filtering-Correlation-Id: 720bed35-9012-449a-06cc-08df0969950b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|7416014|18002099003|56012099006|3023799007|10067099003|6133799003|5023799004|11063799006;
X-Microsoft-Antispam-Message-Info:
	Cyy5p1RX+nDpBXpAiaOIOAf4tPLnq7LQ6pXdotSAF/XHzyP9oGR+0mEc7tu2+jlQ18y1caaPytT99xJFSoHealGpn7IL4U4v+tWl9Uvsnvk0QouC5RpeHtVvvEFiVg7eBunMqL0z1XCKBmbW/WyC6f2+sSBfP7De12569NEt6zvTw7rCJHf2cowAKdY+0j5wslYwSR81Kj5wKe932LzEHpP5mqXkJ9RbHlQKqLNqTcFRTX/trCDGwaKc7C0zBFZYOmM7x4+5ih4+x7YEtqwCEx2zCczR2DM68Myhbrg8aFxx95bPgWAZRkturzDCD9LITZRL4PoDRNH2fZR17yWrV4/HNMpAiMLqaD0ssGlqJCCTgog7jNEdFEcN5OVmpKVSizRzHJpoFwirRQg8w6bpdQn85FciofrCrI6HUIMBkJEJoUrTmaK7o5Ir8+rsHj5jt/gOUWBo8alsE4XsdQwDTC/awa4LLqIrqYE1ewCzM3ohU3NrGybAMpBDShHaMQWF3dO1yrJ4rAhG/jKKIuQrpqOrvDhjfHm7dLrL1eNq25wnGS//LBGQAuHaKp5ugu7CYa6S0HVtiZsuR4VGxZOqnUjVZypAP5zrCE8QZPccXb1bgGvIVpD+NY9lK80z/dnYrOqBQSFvBee4mduGZI4SVxg6x2TvhjZI0yoSGRwsTYo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(7416014)(18002099003)(56012099006)(3023799007)(10067099003)(6133799003)(5023799004)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?jW++k1tMx2MrQKeezdMuLdAZBzRHI/hXZ4XBM0B51N5/NBzEs1eBwAKJhkdx?=
 =?us-ascii?Q?EPluFFE0OxYvmFhvvaXl8Gl7nfa8IFvzYCpXZQHJbL/MRW3GPw/lVPDRT7qr?=
 =?us-ascii?Q?8uQFUeDWY79x4aMcFFlaQbAiefIYS5TUo3NjqXhUw1IP84g7joZmm5mqW9ex?=
 =?us-ascii?Q?2pinIO+bISyuZRyCVUEhEdzd0fxG9VE+wEUjdx0alhID/JuA1knW8agnqxrA?=
 =?us-ascii?Q?5aLsO7i0DkQTgVPLiH6D5bgoHlZDm+1uV4qEsS+me0/HNGpx+1UlC5ERH+ZR?=
 =?us-ascii?Q?K0zX+M565whKOu74B6+j9/uSDoepfy4lOtSZClADTSDbIoPqz5AhqRw9acIQ?=
 =?us-ascii?Q?peNYf6fnCK6GQH2kysmAt3YEenglbK7TYh8zVIwEsHroQvNjkA4hhdtiTamm?=
 =?us-ascii?Q?nZZY+nTonW/4TpudeOOvWsYj8+nlCbALXo8TH12PWOk2kR3KtwlPpyWf2hsW?=
 =?us-ascii?Q?xfwGKedpJVZGb6rjirL0Fow/+K4sMrMKP35PPegRh7LTk+ZZuxC5Fiar7xCr?=
 =?us-ascii?Q?34bUupA+MAvuCv4kRnkpORodcQe4HBmj75enpv/Iw/9iMnhgh079R80E6JXP?=
 =?us-ascii?Q?n/O8ByMc0+49x+B68YWVPDbuMqJyX6sZ0gfbwO9IQGSx0ZwdddDheLNVmejG?=
 =?us-ascii?Q?I2WMv7+CqNHVDchgDEf3JDMW2Cwkg6ruUVaCc9OS/hLsTqpu8gl3H/nN9PS1?=
 =?us-ascii?Q?7I5OzBXAh5GzssMAz0/DiAaHGPW1tINmY+Rpyd9MuiEokZJSu3+dTA9nGyfN?=
 =?us-ascii?Q?fKJa/gfsiaUIbsdvVPL73oCVA6iiX25YwlEO38JlgQHVCy9X8h2LQgFdB5Rp?=
 =?us-ascii?Q?nbTyLfXOfiCF+ahFP8535HcdSsIayGdj14Bjt/oFwBosbQfGkvzH5dTo1zbf?=
 =?us-ascii?Q?+MEciToAiGW10ZyEa5lbGT1jalEy2NgAqVv8WJFs9O4WxpR/5pQ3+XOFW99x?=
 =?us-ascii?Q?6MurENiLeD2UZTghL+d+SP5dITL894w02WTgr/U9mm06XnSJe7IJp2VqiHzz?=
 =?us-ascii?Q?QF68wp/ud8gIfdT29jtK+nL9qIQR7hYH3CGbZ28Ws7Eyb/sGVpzKRY+diwUb?=
 =?us-ascii?Q?E62zSLzC4QOsXgBMAA4La+Bg+yMU/qTspBy3DnoSU40/1PmW+BvoZj5Deoib?=
 =?us-ascii?Q?MUsUyRYk1qG7Ht1SIpHgkLLHeOJfDLIDT6w4zuL0jh42u6tKLQ4BzHK55I68?=
 =?us-ascii?Q?I/kXu/oYcsYV54Pv3D3E4gQVCkaRIFVl1dpyR9j0DC1H69146UIqUjmttVuL?=
 =?us-ascii?Q?zI+0faG1eXNYdqRkY5UKt1E1F0wwg4jUY7Ah1BgvAicU3p9YyCr5leQ/zQsv?=
 =?us-ascii?Q?YNUw8c9TErMGZoXkbRbFN81u02LDhjsXQHQNwooTGlUYKYUkttAw6jdMB73b?=
 =?us-ascii?Q?RNW0EyPM87kki/MtYpxg4GMF0YGH455X03htp+ll0DTgJzXUbrO8f94F/z3S?=
 =?us-ascii?Q?tqVXWLKHsuj47e0pZmPs6uEZY8gmqUvvv48TdsMBGUTvkPAbWWlKL04FUhEz?=
 =?us-ascii?Q?BrAOsA1ZuBp8Dk+BvJOnNZ207QQTVw/GyES1fG1wX6Gxlzn/7WHUDIu5H0Gk?=
 =?us-ascii?Q?l1O7TMGfPxZkcokqR+/p6ROOXFZTnSVe6bGdICyBQeKzI2EyDNtEd8wBIfEb?=
 =?us-ascii?Q?kD42TupshjMeuKZyOTDTxKY6X+mlpwdb1wPhSqFrSG+oc4OehsDwtRkUrN/6?=
 =?us-ascii?Q?dM1KAFtIidPmaR5E9ebb25dEOWNKYi7p06LuRUSQk6AM1kxtSoH1V6P3Zdwy?=
 =?us-ascii?Q?Tl/MTHNNPw=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 720bed35-9012-449a-06cc-08df0969950b
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2026 03:15:18.7920
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pNLkOL8e6LPMdCiFnp3Xvd7TTdRbfhR62EsslZTjTrWK9WcghhbmViVPNJMPihAIgGiFxxgvwe1e+64EXbTAGQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB9138

I'm posting a v3 because Alexandre's and Danilo's reviews prompted a
number of significant changes, and it's time for a refresh.

This series adds support for GIN, the GPU Interrupt and Notification
unit, which is the GPU's interrupt controller, so that GSP events reach
the driver as interrupts instead of only when the driver polls.

The design uses a threaded IRQ handler. The top half touches only GPU
registers, while the threaded bottom half drains the message queue.

Fine-grained locking is left for a follow-up patchset. I'm working on
that next. For now, there is just a big ugly lock around anything that
even gets close to the GSP message queue. :)

This is based on drm-rust-next, which now includes Danilo Krummrich's
PCI interrupt-vector series. v3 carries no prerequisite commits.

There is a git branch with the patches as applied to drm-rust-next:

    https://github.com/johnhubbard/linux/tree/nova-core-gin-interrupt-tree-v3/

Changes in v3:

* Dropped "match GSP RPC replies by sequence, not just function" from
  this series, and moved it to the r000 firmware series, where the GSP
  does match on sequence. The GSP matches sequence numbers only on r580
  and later. On r570, the UnloadingGuestDriver reply arrives with
  sequence 0, so matching on it made module unload time out. Alexandre
  hit this while unloading the module, and I reproduced it after adding
  an unload step to my test suite. (Alexandre)

* Split "retrigger the GSP falcon and clear every latched cause". The
  new falcon registers are now in a patch before the SWGEN0 patch, and
  the handler changes are in the SWGEN0 patch, so nothing is added and
  then rewritten one patch later. (Alexandre)

* Moved the vector and subtree newtypes before the register
  definitions, so the registers use those types from the start. Moved
  the interrupt-tree changes out of the self-test patch and into the
  tree patch, so the self-test patch adds only the test, its Kconfig
  option, and the line that gates a dead-code annotation on that
  option. (Alexandre)

* GinVector now contains a Bounded<u32, 9>, so every GinVector value is
  below 512 by construction. leaf_index() shifts and casts the value,
  with no from_expr() or build_assert!(). The trigger register write
  needs no fallible field setter. LEAF_INDEX_MASK is gone. (Alexandre)

* GIN registers declare their fields as LeafMask and SubtreeSet, with
  conversions to and from Bounded<u32, 32>. Every tree write uses
  zeroed().with_...(), so the field types prevent a SubtreeSet from
  being written where a LeafMask belongs. Leaf accesses use Bounded's
  Deref and the build-time-checked at(), so the try_at() and
  unwrap_or(0) pairs are gone. GinVector::validate is const again, and
  the LeafCount casts have CAST comments. (Alexandre)

* nova-core now defines its own MsiType, with Msi and MsiX only, rather
  than using PCI's IrqType, which also includes INTx. SubtreeVectors
  stores the MsiType, the HAL's rearm method is no longer an Option,
  and the INTx match arms are gone. (Alexandre)

* Tree::new returns EINVAL for a subtree the architecture does not
  implement. drain() leaves TOP disabled for its caller. One iterator
  walks every implemented leaf, replacing the nested subtree and leaf
  loops. request_for computes its entry index inline. (Alexandre)

* The self-test disables every leaf before draining, and uses one Tree,
  which it reaches through the registered handler. That gives
  disable_all_leaves a caller, so its dead-code annotation is gone.
  (Alexandre)

* Renamed dispatch_event to classify_event. A non-matching message
  reaches it through the existing else branch, so the second check of
  the same condition is gone, and send_command's documentation no
  longer names a private type. A poison() helper logs the reason and
  returns EIO. (Alexandre)

* await_msg takes the queue lock once for the entire wait, so a
  concurrent send_command cannot consume the awaited event. The outer
  Cmdq::receive_msg wrapper is gone, and the errors it propagated are
  documented. (Alexandre)

* The GPU owns its interrupt now. After GSP boot, Gpu quiesces the
  tree, registers the handler, and drains the queue that the GSP filled
  during boot. Gpu allocates the vectors as well. The handler borrows
  the command queue and the device instead of taking an Arc and an
  ARef. The chipset accessor, the command-queue accessor, and the
  unsafe BAR lifetime conversion are gone. (Alexandre, Danilo)

* The tree reset is now a SubtreeVectors method, which resets the tree
  that its own vector allocation covers. The vestigial SWGEN0 clear
  during falcon construction is gone, along with the Falcon method that
  wrapped it. GspInterrupt no longer uses pin-data, and its constructor
  returns Self. (Alexandre)

* The top half intersects IRQSTAT with PRISCV_RISCV_IRQMASK and
  PRISCV_RISCV_IRQDEST, as Open RM does. It sees only the causes routed
  to the host, leaves the firmware's own causes alone, and clears the
  latch of a host cause it cannot service. It masks nothing, because
  PRISCV_RISCV_IRQMASK is read-only to the host and FALCON_IRQMASK does
  not control host routing on a RISC-V falcon. (Alexandre)

* I found one more problem while reworking the series, rather than in
  review. The subtree has to stay enabled at TOP while the handler is
  registered. The startup tree walk leaves TOP disabled, and the
  pre-Hopper MSI rearm is a configuration-space write that does not
  enable it, so nothing enabled it and the GSP vector never reached the
  CPU on that path.

* The interrupt document's glossary defines leaf, subtree and tree, and
  the entry for a disabled vector now says that its pending bit does
  not set the subtree's TOP bit. Register imports use a module glob,
  commit-message bullets start at column 1, and Alexandre's Reviewed-by
  is on the two rust patches. (Alexandre)

* The document dropped its description of matching a reply by sequence
  number, along with the patch that added it, and it no longer says
  that the startup tree walk restores the TOP enables. The rest is an
  editing pass: the register list was written out twice, so it is one
  section now, and I rewrote the sentences that needed two readings.

Tested on Turing (TU117), Ampere (GA104) and Blackwell (GB202): probe
and chipset identification, the interrupt self-test, a GSP name query
over the command queue, driver unload/reload, and the KUnit suites.


Joel Fernandes (2):
  rust: sync: completion: add wait_for_completion_timeout()
  gpu: nova-core: add the GIN interrupt tree and allocate its vectors

John Hubbard (12):
  rust: pci: declare IrqType and IrqTypes with impl_flags
  gpu: nova-core: add the GIN vector and subtree newtypes
  gpu: nova-core: add the GIN CPU interrupt tree and MSI EOI registers
  gpu: nova-core: add the per-architecture GIN CPU interrupt HAL
  gpu: nova-core: add an interrupt delivery self-test
  gpu: nova-core: log GSP events instead of discarding them
  gpu: nova-core: recover the GSP receive path from corrupt framing
  gpu: nova-core: bound a GSP wait by a single deadline
  gpu: nova-core: add the falcon interrupt status and routing registers
  gpu: nova-core: drive GSP events with the SWGEN0 interrupt
  gpu: nova-core: add KUnit tests for the interrupt tree and HALs
  gpu: nova-core: document the GIN interrupt controller and GSP events

 Documentation/gpu/nova/core/interrupts.rst  | 716 ++++++++++++++++++++
 Documentation/gpu/nova/index.rst            |   1 +
 drivers/gpu/nova-core/Kconfig               |  15 +
 drivers/gpu/nova-core/falcon/gsp.rs         |  71 +-
 drivers/gpu/nova-core/falcon/hal.rs         |  92 ++-
 drivers/gpu/nova-core/gpu.rs                |  68 +-
 drivers/gpu/nova-core/gsp.rs                |   2 +-
 drivers/gpu/nova-core/gsp/cmdq.rs           | 241 +++++--
 drivers/gpu/nova-core/gsp/commands.rs       |   8 +-
 drivers/gpu/nova-core/gsp/sequencer.rs      |   8 +-
 drivers/gpu/nova-core/irq.rs                | 163 +++++
 drivers/gpu/nova-core/irq/doorbell_test.rs  | 301 ++++++++
 drivers/gpu/nova-core/irq/gsp.rs            | 239 +++++++
 drivers/gpu/nova-core/irq/hal.rs            | 170 +++++
 drivers/gpu/nova-core/irq/hal/gh100.rs      |  29 +
 drivers/gpu/nova-core/irq/hal/tu102.rs      |  28 +
 drivers/gpu/nova-core/irq/interrupt_tree.rs | 664 ++++++++++++++++++
 drivers/gpu/nova-core/irq/regs.rs           |  91 +++
 drivers/gpu/nova-core/nova_core.rs          |   1 +
 drivers/gpu/nova-core/regs.rs               |  66 ++
 rust/kernel/pci/irq.rs                      |  68 +-
 rust/kernel/sync/completion.rs              |  23 +-
 22 files changed, 2942 insertions(+), 123 deletions(-)
 create mode 100644 Documentation/gpu/nova/core/interrupts.rst
 create mode 100644 drivers/gpu/nova-core/irq.rs
 create mode 100644 drivers/gpu/nova-core/irq/doorbell_test.rs
 create mode 100644 drivers/gpu/nova-core/irq/gsp.rs
 create mode 100644 drivers/gpu/nova-core/irq/hal.rs
 create mode 100644 drivers/gpu/nova-core/irq/hal/gh100.rs
 create mode 100644 drivers/gpu/nova-core/irq/hal/tu102.rs
 create mode 100644 drivers/gpu/nova-core/irq/interrupt_tree.rs
 create mode 100644 drivers/gpu/nova-core/irq/regs.rs


base-commit: 6cb331644c441ff4101a4f8726283a6ed0d5947e
-- 
2.55.0

