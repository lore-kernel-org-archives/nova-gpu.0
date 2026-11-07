Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.56.36
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794044935;
	b=Wn6eHSZqQYne9DrN9pNwBv5G3lM2inWqGDCj2I2nJDjjUfkurMTbXWU4K6eaoUepRZs7
	 LcdPZw3rjuUrnhIi2i9le6hPL9oZZDtNeuLuOq2mf2JBBWrc9Oy6EOgDNVWiGd2eN6/yv
	 Qkf7NFJgxopSmq2TxYuiBuzhLJLIYl2wfrNHngGnKV2bY8xcvTXUzUCBH2N85tzx9zb+j
	 8QaQ2SAFg4pWpG2Apy0buYmSCDeesK1ZJBUh+0NuunmwSpOPPAh7kghHIwEwbrZtr5017
	 W8W71U/dhqW5u8126C/z7dCDzKeNUkX5Xyr5KTBD34Ol0lXfiI3DNEbAXkcGS1HVTLg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794044935;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:Date:Subject:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-ClientProxiedBy:MIME-Version:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:
	 X-MS-Exchange-AntiSpam-MessageData-1:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=jXVruuaSSWuuHbTQxlkv5w2KinJFxC/hE3gw37zBqus=;
	b=rBFj9IMIocFM7NouQhxjyiZffuR2NS9Z/v4FgTXYZJBeWstoWHXxxIiYb5go8N3THJko
	 NQ5D8IzXy7F9ZhqWOV89Jk46L7hKHleiGgrAp6ft0CFfTStV3kqiLERFkZ0A9r5S96fQS
	 vqAgkyxnkHz7oem0hUZVhxZn08ZDQcq7M8SrJiOYCPk/zuG2f9xH+PzwIJGp9xseyzvTj
	 wN7edNhZaNhSrA95O/AMkVztOk+yzoHMje1YVTg6wiHcUvic+zmjJSIwrE+vecHtgqaJa
	 GwALy1PSo486xHCGfpSyNBrlC35CcYOxtHEctOveSIp6NL4+iyJDF4tUW5m+PlsC4Iw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=e7tNw60S;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.56.36
Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010036.outbound.protection.outlook.com [52.101.56.36])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D499606D827
	for <nova-gpu@lists.linux.dev>; Sat,  7 Nov 2026 09:48:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6D499606D827
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=e7tNw60S
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OSY1oQW8k3+C/A1MyJVtk/Rl5193izE1hs8WmbD7XK/kg9qIyX+uRKZsAKmBK+w+WWPzv62u6N3j7Q2vDiU4Beyh0yAml9UaqSgpPKt33+s1MXo4lS6inFXGj/o2fpuvqWzOqE+3oS2fcGbNEtuCCKwNtSHtAgsccO9VjMVwlAKjyJS5pdQaSx/XqDkO1cqLxRFvfoNc9acNnFtNaEErYfyk9l+wGt7rJ74rS6ImD01LYZSy3cbTd5UfsAYoxpUCisV3wX0fb0wzjFdSSBFXoZOTbJp8bIvGETs9eYQCp2wbfXqcxeB9igGdkU3r1zMiGNovyCo6q6rDyj0pSV34Zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jXVruuaSSWuuHbTQxlkv5w2KinJFxC/hE3gw37zBqus=;
 b=hwWEBNq4N3bIgwrXsPIoBgAc0AZHAHUuCIApn2OIPUFgG0fgWks3fVrB+qrAdW6NuktNH16k6Cwg85XZHdwEJr0V/EPYe+G48QH59jST+E1RMCxehan9ZwS3fvb8z4HL4IROz+35YGtcAaBChiUBeRMX3caGgKExzLSYJHQAs8r/7Cs6rsEnEMKFPM1lF5WwKSPe45pIFndGx4mH/TRoPsUbF0NxwVhQudP1o3UZBNuxa9Ps0W+/7gqJf7z88SjdnRyDzGnbEsWhYyrtovjwowhy9tyTbU98OXhXvEP3/TNE+XFtAD7uS5GVzxw9HvSYhmBaEK+vs+LAGqMptaOswA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jXVruuaSSWuuHbTQxlkv5w2KinJFxC/hE3gw37zBqus=;
 b=e7tNw60SFey3oKySQv95hAW4f2gdbhHojHelkuklHHx6jFYchcLt955qH90L7x6sq/bhZfUbBPUJjegNcSENPd6pj7VxS0dSL+brK6J5YoLxe8NN526Hi5wCZ8M2CqB+ECAR8/UMrUXQlFFRQgTIOolRkVLlb6Ute0gfl78bLVSAkGzUH6yOBKNXEcqhCk818vFOmASuoI+FsG4rGP5AqSz1lKM8fEsldOzmEaTi7dllME4Mkd1y/9Rsv28QvXp/5Lr2YqrqA+y69vUF50ripxR6iR/cH1gj07AdF/DwOkac7U0XJapgGKNPcwjc3HunZQ8sNvTbuTg2s4mxdNhXFg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MW4PR12MB6873.namprd12.prod.outlook.com (2603:10b6:303:20c::17)
 by DS0PR12MB8269.namprd12.prod.outlook.com (2603:10b6:8:fd::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.11; Sat, 7 Nov
 2026 09:48:49 +0000
Received: from MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1]) by MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1%5]) with mapi id 15.21.0592.007; Sat, 7 Nov 2026
 09:48:49 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Sat, 07 Nov 2026 18:48:04 +0900
Subject: [PATCH v2 08/12] gpu: nova-core: falcon: rename the local
 variables of dma_wr()
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261107-r000-fw-v2-8-fb37cc5b20cd@nvidia.com>
References: <20261107-r000-fw-v2-0-fb37cc5b20cd@nvidia.com>
In-Reply-To: <20261107-r000-fw-v2-0-fb37cc5b20cd@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: John Hubbard <jhubbard@nvidia.com>, 
 Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 Eliot Courtney <ecourtney@nvidia.com>, Zhi Wang <zhiw@nvidia.com>, 
 nova-gpu@lists.linux.dev, rust-for-linux@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.15.2
X-ClientProxiedBy: TY6P301CA0022.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:3bf::8) To MW4PR12MB6873.namprd12.prod.outlook.com
 (2603:10b6:303:20c::17)
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Post: <mailto:nova-gpu@lists.linux.dev>
List-Help: <mailto:nova-gpu+help@lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
List-Owner: <mailto:nova-gpu+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR12MB6873:EE_|DS0PR12MB8269:EE_
X-MS-Office365-Filtering-Correlation-Id: 02887ad2-923e-4920-30eb-08df3cb452a8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|10070799003|376014|23010399003|18002099003|22082099003|10067099003|11063799006|261026121527099003|261102123227099003|261021123027099003|56012099006|261021121427099003|261009223027099003;
X-Microsoft-Antispam-Message-Info:
	r0nJzLoKG2PJ/LHoxNqjCoRyRo/NXrQ8EHkKXsUT1JDKlgTVP9GDx2tOzsewkwh5k36Bc8KNWz0mXFHTF7+czAZvP2JBzoFFSVkDz0ienp9kNiUA6NSWLWkPW3q2p7sS5SwE2zz8K6dLNfmPEBy0ga3avELPHYr0Niat7SC0cQqrMdLSFRhwiLrDoTLxJIBgVBIq8hpTp3KjkJOhq7PWy5hpU8mK9+21GOrlxAOGlRZexpaEnWHJTvms9UFkasezZzbuFxvA/U5WTvsGH150RmKiMgiVSfRPXK7AT3zHX5gKoZluGXNOdkaZ123ORMMxGhAe85d5gv4FFHhZPSqCQPlDJ4XyyFqDuC0WlqqIYdyM6wigLWeyYi9ge4k9cv5+f9opLAWjiUC576NG5KlL/3TiewHJIT9pcgc1a6Ci3OZc+v/OPUUy5CG/NVWVo85MVpegan5Kl5GPjCYxwh1mjdZ/3dbNwKP37opR8+xenJYeVxHW8suXM15tN6y3YDOgi8WtmwLFCX6ooGkMEzEMoaZFo6LHhAm5O4E892njqatXUDe19p7xXBwGyFsJEV7/LtfEu2JDHRBe350IkcLHQVPofmU+DAP2DYH2+dXicesUJjTTWJ47Z/UI4tNNc57kIQGKEkoz8uIlRhAY7DuvdtsLmQFI5vPfUcvC001MKpw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR12MB6873.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(10070799003)(376014)(23010399003)(18002099003)(22082099003)(10067099003)(11063799006)(261026121527099003)(261102123227099003)(261021123027099003)(56012099006)(261021121427099003)(261009223027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aWh1TTVpS2VaZmNocUtVZUtoQ1FQc005OEZldmwzOXB5Zjk5K2o4U0UrNWN6?=
 =?utf-8?B?cmxwUlB2djdPTnNBSm9HbHRSODhGNlcwbXF5TncwWFJNaEVLUTdYRXZWT0E0?=
 =?utf-8?B?VUU4blZsR2IxQjh6Um4yNGNrSk4vQnRUdzBCZHpFYWFpa3BxT2xHMDlvYi9R?=
 =?utf-8?B?b0dONTFhRkQ1MHBHZE9MdVRkMkYvK3A5Mmw0R2Y5L2xudE91RnZheHFUUE9T?=
 =?utf-8?B?Yll5YWliK0lUdWY5aEZoMGVZcitwWHgvK2kwNTBQWWtkKzJkSUZZVlRHenJT?=
 =?utf-8?B?Y3R3Wk9mQkt5RnJzREViNDJoZnJ4MUI1UXBFemVyQVk0eDZ0akEzdmczNFRt?=
 =?utf-8?B?eWZxQ0gwYU9EVW1xOXd3aW4rOVlxRTZkdkI3STVPc3NyN290ZUx6WXRrTW55?=
 =?utf-8?B?MWN0UE11UXJiWXJkZHYxeHgyYzBtQ25NQWMrTXhIY2tEM2FLQk83Y0RDTWFC?=
 =?utf-8?B?WlEzaWVhWE9BT1VHZngzZlp4dmZrY0IvM05VSXpPbnc1S2s0anI5WnlFSEcx?=
 =?utf-8?B?UEI0VXRtdEhJY0xIWE5zR0xvVmRmQ3p0ZmhBRTI1SGxUSHhER21QejN6d29W?=
 =?utf-8?B?eGdZKzNIbVVyLy9wdndsU0pPbDhVTDg4SU03N1VoSTRNSFA0Q3lRTTVqZDNP?=
 =?utf-8?B?Y01vVHJtTzZyVHhsYmI3eTAzNjBBa1QvaGdhdDlHZWVjSW5mcSs0SHZDZlVQ?=
 =?utf-8?B?NkNaVDVOU1Y0NDd3MTNCbzk5ZldaLzJtNVdUYTZHS1VVWEQxc0NLZngzUTc1?=
 =?utf-8?B?NTJ5bmlSRStuNEdiM1ZyNnhpYldhUDlkVFF6ejZtL210NWY1aG8vekRpRG1V?=
 =?utf-8?B?NW52VFUzV1J3MHFyMG00b3BDNXVsTExGVlNzSHRRN2puQ2lYbExzVHJkNitp?=
 =?utf-8?B?c2s1YVE0c1h3cnFPbDRVaktJdjg3ZWtvb0NLdjBPM3czQ01jZ1ZtZUE1OUZn?=
 =?utf-8?B?UFJhNFpZT0NiZTFPQ2luRHVnd2lUNGphSGpxMHRUMlFBdng2dGZXc2VXWWdI?=
 =?utf-8?B?TlByeUxFU083NUFIKzBtbkFwWG1Ua0ZPRVpoUjByeW9rVGc3NktSc2oxOWpX?=
 =?utf-8?B?eUN2bnVncXFEV0FFUm5IOXFtTVlQSEprWWVjQlE5R1hNRTZsckxYcGJQemxx?=
 =?utf-8?B?TmtTQVYwbXpFa2t4R1lzMnIwRDdJV01DQWUyY0l0L1BGdm1CeHIxN1NjMENp?=
 =?utf-8?B?Tnd0blcvMWhVOVg4c3FJUDNrekdscE1hTkl4SysrNFl0VzFaZEZxeTVWN0tp?=
 =?utf-8?B?ZFF1YXIwYVpMUFdvOVFtWlZFR3QwWkpFSFdTQys5Ulowc0Z2YUR1WXRtN0xv?=
 =?utf-8?B?NWZJcXIvRUtCcEgyc3daTGhENkpIK3pVNHZmd3B5UGRFM2FTcUZhTkRQRVpa?=
 =?utf-8?B?dFcvYzYzdHE3WUtmWllQcVRxMElFN1VKSU9ua0FaZWw2M2txQStBWGROV0Ew?=
 =?utf-8?B?TWFYbnFxazBQUUpRL09DRHNtY041VEZCZUIzb1djRTFjemxXTmVLZGU0dVdM?=
 =?utf-8?B?UXp0RjQ3NDdFNEFSS0huc3d3UkpXajVYeG9aalliajJ2WndjTjJJQmxyenpu?=
 =?utf-8?B?MHNadC83VUtNVDNuaSswTUdFcXhZalZ0N0N3eFBhb0krcEtsN0Z2U0hnbzhl?=
 =?utf-8?B?aVVqbjJ6eHRiak1PS2dQR1dFUFdvc2xDSkZUOXhoQjNEblRyZjhQRzdUYTFk?=
 =?utf-8?B?MW1EYkwwSE4xcTlORUwwUkdpVEhXTTAyMUJ0bXpHL3hRemFwUXppQXVKTWhZ?=
 =?utf-8?B?RmZ4MmFwUWYxbzdNbWlzbGpqYXhKWE05RlZzMkZucllzSWE0OTZkREJGZVhC?=
 =?utf-8?B?d3ZrQW4yTzBPV2pWWklyQ1hqRGFuRlNjRjNPckpnUHNXUStoV3YzZy9XYmNm?=
 =?utf-8?B?K1VQRk1mZXVYbmljcDlDK0NiWGs4WG8rMWJMdHljQnU4Uko2UVFHTHFSbGdI?=
 =?utf-8?B?YUh0L1QzeGh1Y3ErdXdWb1dtUmFuVlYvN1pmZHNWSlhQSFl1b29leU1PeExk?=
 =?utf-8?B?YUQwVDhJZXVsaXdKZGpBVVllYS9SekpadjlMSTVMMEdrc3JIU2NZN3VLK0E4?=
 =?utf-8?B?V20yR3YrMVZpMkhlRzVDYU9Pam0vbGFHbng0bHp3NEUvZEdQR3RVT0Q0Vmpy?=
 =?utf-8?B?WUNoSDJOblBuU3p3RUdWeXZudS9JL2dRSDVqMit3Sy9MOUJaSUJ3dndFdVBs?=
 =?utf-8?B?Mk5UeGl6REx1MEtMblVURjNUUE5JcDJydGhHVjFLMlpFUFg5TVJuMk9sWURy?=
 =?utf-8?B?L3RIcEwwbG1oamZyRkNKZEtmYjVzZnd0QlNmaVJ2ZlNRb0dmNmFhSFdYQkl1?=
 =?utf-8?B?VzE4a3oydkQ1Z0hybDUxVCs3cXBYYjNBZXZhdlk3aGVzNlNodk5EQVRTaWZu?=
 =?utf-8?Q?4OT+IMXjMVTbSAjFzzwD5x31GPIhmjKti6Hjf95/vhUtq?=
X-MS-Exchange-AntiSpam-MessageData-1: 0pkZ4gbpYlenHA==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 02887ad2-923e-4920-30eb-08df3cb452a8
X-MS-Exchange-CrossTenant-AuthSource: MW4PR12MB6873.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2026 09:48:48.9611
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AOYDld54uCKONoT8JPKHJpJ2atmilSli4525iqzLEIrbLUByQA0D/1ZFdbABNyusT7aYBHepNzGKmr2cPBuHRw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8269

The local variables of dma_wr() are named after a generic DMA address,
while what they hold are the values programmed into specific registers.
Worse, the `src_start` local has the same name as the `src_start` field
of `FalconDmaLoadTarget`, but a different value for DMEM transfers.

Rename them after the registers they end up in:

- `dma_address` -> `dma_base`, programmed into DMATRFBASE,
- `src_start` -> `fb_offset`, programmed into DMATRFFBOFFS,
- `dma_start` -> `base_offset`, the part of the source offset that is
  folded into the DMA base.

No functional change.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/falcon.rs | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/nova-core/falcon.rs b/drivers/gpu/nova-core/falcon.rs
index ad497a5704ec..3b3e8e0f821a 100644
--- a/drivers/gpu/nova-core/falcon.rs
+++ b/drivers/gpu/nova-core/falcon.rs
@@ -562,13 +562,13 @@ fn dma_wr(
         // For IMEM, we want to use the start offset as a virtual address tag for each page, since
         // code addresses in the firmware (and the boot vector) are virtual.
         //
-        // For DMEM, the start offset is folded into the DMA address.
-        let (src_start, dma_start) = match target_mem {
+        // For DMEM, the start offset is folded into the DMA base.
+        let (fb_offset, base_offset) = match target_mem {
             FalconMem::ImemSecure | FalconMem::ImemNonSecure => (load_offsets.src_start, 0),
             FalconMem::Dmem => (0, usize::from_safe_cast(load_offsets.src_start)),
         };
 
-        let dma_address = {
+        let dma_base = {
             // Upper limit of transfer is `(num_transfers * DMA_LEN) + load_offsets.src_start`.
             let dma_end = num_transfers
                 .checked_mul(DMA_LEN)
@@ -576,10 +576,10 @@ fn dma_wr(
                 .map(usize::from_safe_cast)
                 .ok_or(EOVERFLOW)?;
 
-            io_project!(dma_obj, [try: dma_start..dma_end]).dma_address()
+            io_project!(dma_obj, [try: base_offset..dma_end]).dma_address()
         };
 
-        if dma_address % DmaAddress::from(DMA_LEN) > 0 {
+        if dma_base % DmaAddress::from(DMA_LEN) > 0 {
             dev_err!(
                 self.dev,
                 "DMA transfer start addresses must be a multiple of {}\n",
@@ -594,10 +594,10 @@ fn dma_wr(
             .write_reg(regs::NV_PFALCON_FALCON_DMATRFBASE::zeroed().with_base(
                 // CAST: `as u32` is used on purpose since we do want to strip the upper bits,
                 // which will be written to `NV_PFALCON_FALCON_DMATRFBASE1`.
-                (dma_address >> 8) as u32,
+                (dma_base >> 8) as u32,
             ));
         self.pfalcon.write_reg(
-            regs::NV_PFALCON_FALCON_DMATRFBASE1::zeroed().try_with_base(dma_address >> 40)?,
+            regs::NV_PFALCON_FALCON_DMATRFBASE1::zeroed().try_with_base(dma_base >> 40)?,
         );
 
         let cmd = regs::NV_PFALCON_FALCON_DMATRFCMD::zeroed()
@@ -611,7 +611,7 @@ fn dma_wr(
                     .try_with_offs(load_offsets.dst_start + pos)?,
             );
             self.pfalcon.write_reg(
-                regs::NV_PFALCON_FALCON_DMATRFFBOFFS::zeroed().with_offs(src_start + pos),
+                regs::NV_PFALCON_FALCON_DMATRFFBOFFS::zeroed().with_offs(fb_offset + pos),
             );
 
             self.pfalcon.write_reg(cmd);

-- 
2.56.0

