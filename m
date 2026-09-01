Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010015.outbound.protection.outlook.com [52.101.193.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4DEE35950
	for <nova-gpu@lists.linux.dev>; Tue,  1 Sep 2026 00:29:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.193.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788222580; cv=fail; b=CdkGAjOZmBkybceFeNRqxSeB79tywdY5aIIJ/zUiexxuQH2Qi1HDVgWJkhX3Irb792tix4x2jI83pAOARR93MP1V1muKsAO7oVhTOOsKvs7hvb1rOJZllexEw9fEzzO3aLtV2b/sgkPetOobUlf61KezfUAU5+ZQpQOAF5Hcp5I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788222580; c=relaxed/simple;
	bh=aGORontAcbTmfJlntyW6ZYUWCPy+mcTGINZHL/rNK6M=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 Content-Type:MIME-Version; b=YIWMLmrRB4/MBuLScQ2HDnFZylwddiOGiKcHyUaz82Oi8dDcpjcYKIPddw6eWzlXj13Kxkrf3JVrht28rFhT616nSUZgT7rnkDYXyYEgYz/biqKQJt6LzdyoftKB0cmFvAjZbwcOCMoASvwGfs5MgT/aql2x0VUODbKnXxmOcWI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=mUGbpkSz; arc=fail smtp.client-ip=52.101.193.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="mUGbpkSz"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N1gKwe5SZnGvcbkbws3xS4T/Y9BbCqb79+5rtLNUw7NFvN0zch5gY/pn4AOvR6kiRCbs+jQlX6CFNu/Hs66S6O3fsko58wuVfFNtq+9GrLelRlPZcrZ0JZZb7i8DUFJoHkKAK79DkE8Gl7geeX++AcDlpYfmr4Hkxdbmnscgea86WrG6XFGwv5Tf5uxNlmFpx8YcW6ZbY2K/YHxY5idnE/eXIDioRaolT+dZFaproBkqPpo2at39rE+DkrKbzt34wnnHDYmmUljCkLCo3tDiJhEnP/2JRJtNEkcBvpj2DLSt4AJbQjVMZl7oK99TkMevzbpTmwiamgT3pmdI1oh38w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6c01a0DnvYnulrj950iqXF6UPHQ4Puy8ZT+hWYSxKec=;
 b=ykYwgyBSw17tvRmgbLxKxwxa3d09T2PiiR0Bv9fQkqHUJnlpRV6QQfhRczLz0+Ho1lOzaHCT/Lx2W/fw3sdWvEz3S345z4WNu8ljx/Q2/VF3xUctUGMlbnMRRrhvAIaEYcNhytsacDpcns9Dr2mD9MCI3DtrGR8PYLtkuHhMApGe9JN0a25FwMK455ZZ5lO+Y1tMOOK87eQdZ1ehOh8a3z+nmfQkHvd3F27oaYp+a21/GIkc5dsoCItPFLR7DcA+XFVN8D5n/SJZGMZp7/cmSuGaBowtUmAJBuhQtwqxywEB5QdekaEylfGX5rhniSSvCQJyK6u8wHl93nsFjRob0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6c01a0DnvYnulrj950iqXF6UPHQ4Puy8ZT+hWYSxKec=;
 b=mUGbpkSzYvxRdBgFQL3bFADec2LfXOjHjW9Sp59g8V/RtBhWJUq7GzCS99tSYuInzrG58X2QwEFarU+JtIk2rz+WruC+HYUs0/tp1Vgrruypf6nrHsQYxPpKW6Plh8Ph/CiKqmtuj3JFG65TUiYBT/dlRi1jygtDgHzDk4/XSrQzU3Ih/esAz4nE7JcUah3Shb8rG/iGjJnPPoyeWD9I5LbvUpL9f3MnFCleHgXnisImLX8jAtYA93zVf6aP5+UVr5iHUnPR9NfetiY95F4AtBkY4oX9wYKehvfx4Kn6ikP9pRC2EjjW7FCiNVBf6jyFBjbbw9chkFPfPO6vQYPl9A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MW4PR12MB6873.namprd12.prod.outlook.com (2603:10b6:303:20c::17)
 by DM4PR12MB6349.namprd12.prod.outlook.com (2603:10b6:8:a4::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.360.13; Tue, 1 Sep 2026 00:29:33 +0000
Received: from MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1]) by MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1%5]) with mapi id 15.21.0360.008; Tue, 1 Sep 2026
 00:29:33 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Alice Ryhl <aliceryhl@google.com>, Benno Lossin <lossin@kernel.org>, Gary Guo <gary@garyguo.net>, Alexandre Courbot <acourbot@nvidia.com>
Cc: John Hubbard <jhubbard@nvidia.com>, Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>, Zhi Wang <zhiw@nvidia.com>, nova-gpu@lists.linux.dev, linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
In-Reply-To: <20260825-gsp-fmc-rename-v1-1-f82526f01d7d@nvidia.com>
References: <20260825-gsp-fmc-rename-v1-1-f82526f01d7d@nvidia.com>
Subject: Re: [PATCH] gpu: nova-core: fix incorrect naming/framing of GSP-FMC firmware
Message-Id: <178822241574.820888.15282162882829649678.b4-ty@b4>
Date: Tue, 01 Sep 2026 09:26:55 +0900
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TYCP286CA0041.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:29d::16) To MW4PR12MB6873.namprd12.prod.outlook.com
 (2603:10b6:303:20c::17)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR12MB6873:EE_|DM4PR12MB6349:EE_
X-MS-Office365-Filtering-Correlation-Id: 156dab90-0ace-4992-d299-08df07c01846
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|23010399003|366016|376014|1800799024|56012099006|10067099003|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	a63/b925wJeZ5jU3R8Bt3X7cnb180aDCVuDOHC921v289n5Zj77O0/hzwFnc0CxjsYWxc0y/bTzwgy5wVKdnoukvkixNmKf+BcKuw7vNJtrgoRWw3zaMXJNhXtLW6myFl1l481fIX4locnllsOJLs/CKHXMIIXaUqrmBWGEe7/brnmxual8DqKTJaGdbbR/fDCN0fIL9B4B+3myZ9lrl49ivtki/lGxCt09rNFXahcs9jx0kMGhE23igohXn/mfItO0d2zAzV5NixhGI0pQXTFLqTu3YvEl9061Bdptgj5c+7sP5pRlcjygApcXRdam600/7JKgbqyHYHCNgId/j8oQycMopBsjj2xL4bfZESZLK5mvnfloigzb0NJOUdKhekxVz9eIfDZhGhM+S3w61MFrPCwxE2/eMzGqwUsy0bwreIiOTwZJWvMvA3DM7IZ/LRq2ycWJwCQXkFyvxp/lFYvzk373++V3BDPqOSJkZxRb0hnJ0sGf89DpriCtk0WmgtND9MhSl3QdRBuT9edSawPvAJF+1goYnbMupGa48UyYTuERNbRMmPKcynMWn7kelyYpvCzpSHkh8mC2IwwgF/86fj3FOOe7EnCRVPEwn78rlJraP8ptxvgSXrwHGhSBohVV7XmxVGuefZwY3BnvSi2eDAAb2/ubwJjHMxKKKzR0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR12MB6873.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(23010399003)(366016)(376014)(1800799024)(56012099006)(10067099003)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Wm5YNzE5ZWhqWHBGTnR2UFpaaXEwNm5hbUU1bUM0alNFNTRJbHFTaW1FYUxS?=
 =?utf-8?B?K25IWTZ5K1ZQQm1iZ2lGRjBqUkpjYU5VQlNHSTVUUVZ6cjRocGZNZ1JQSGxX?=
 =?utf-8?B?aEp1MjV3M29oUjg4ZUdvRjVCOXJzODRFMUl3WWgrVG9GNUdHRFdmZXZOcnNS?=
 =?utf-8?B?LzhkUVBPb2dicWt5SVE1T3BaZUx1MkdheG9OL0tLemdjMEdLNnVYdDQ3NTdl?=
 =?utf-8?B?Q0JOZ1FuQmZVTWRrNzRMSnV5M3VrdlpNN0dMRllmbEtFRmJzcWowaURBbWJU?=
 =?utf-8?B?cEVYS0FxY0hjYnRaVHNvMnUvcG1sa09XK1ZlTFhERURMN05YRUlGdHVsUEhS?=
 =?utf-8?B?TWgzMjdrSElPUnZMbHBkSEgzMjlPazdvc25NdVRqSVlYQWZXZzZhQVlhR2Rm?=
 =?utf-8?B?a2d6SEdRbEZTRyswd3hWMTBab1JNOTJoTnhOeDZRYW40cTRpN3hSUlp2elpn?=
 =?utf-8?B?NTgyZXZtd1g5T3JBZGVPcVlJcUNVTGJObkhpZ0VQMjgvMTFLYktVQnJKNFZa?=
 =?utf-8?B?NFdlblpmVVc2Rk1jcmdEYU8vanNGSmwzMzVicU5DdldXclFjZlk2LzBWbmxK?=
 =?utf-8?B?R2lDcGs2am1LV1Zta0VVRFE0NWozeHBYMG5Jd25aNG9MRU5SMzZGblhUUFBL?=
 =?utf-8?B?MWtrSi85NUNqQXV2TlJISE1EWFZITWF5TENPOXd5UUlLMjdESHhLVXMvUjR0?=
 =?utf-8?B?WnBCRUJ1MVFuTjZSK0VOY1VZYnlIOXpka0RWWUYraEpVaHZLZnRVK3RDMm4x?=
 =?utf-8?B?VWJvemFMaDBET2FmOVkyOXB1N0tRbEx5eHBDMEhwNkxxcEpPTk50QTNUT1Zx?=
 =?utf-8?B?QkpndFRWbHRwUDZMK0h6QytjYTdMaktxZ3lwOURXbFl4YnZDWjE2MHBFOWd4?=
 =?utf-8?B?RWlWQk0yOGM2L0FmRkNOcjZhUTdyT0hYMStLNWJESlo1TjNuNmZleExGT0I5?=
 =?utf-8?B?UjdhSHFQQisxUVM2WTEvcWFtMnJ2ZEpXTFBGV1lZOGp4S1BrMGgrUmU5RTh5?=
 =?utf-8?B?ejlHTTFsd09CVWNrclc4TFZTL0JEbk4raTNnbmtOZzdTNndnVDZWM1VBOE9S?=
 =?utf-8?B?R0N0Nk1IOTFNRjlEaGx2NkRLK3dyeDFKZ1VrWVA0OSs0QjY3Z2E0Vk9WVGlL?=
 =?utf-8?B?WEwzTDl1YkZWUjB6VkwvcTVQRWxXeTRuVHQ3ZnRzSjYvWjc0VnRIUGllZHB2?=
 =?utf-8?B?NXgvaWFQUkhGQUhnQTRidlRyeEFydDRaa3UwNmkrdUEvZjE5STRsWUtuNDFM?=
 =?utf-8?B?ZTN2SmdCYTdqbGloQlRzZEl4YzY1dkZkZXJSblhwOG5hWXpEbXZKbHlraEpj?=
 =?utf-8?B?U1hhNTk2RjV6Q0FpYnFmdldLcE5HZmN6SW1PeFVlQjBjZlhFTzlGOVJSS3V4?=
 =?utf-8?B?VTMrdk9SMEdabXJDbFJhZitvWTNHQks3UGlGZTNoUEg5QmMxNGVwbllLRk9o?=
 =?utf-8?B?S0QzKzZpZHdsbkwyUUU4TDg5Yy9WRjdyNUp6ZWY5QytadjBVWGI1RXllT1dL?=
 =?utf-8?B?eHdlZmpxaUNINGl1T0hIK25TemMzYnZPUUNORVBpdTg4WmpJLzhRNEhUNmpw?=
 =?utf-8?B?L3F5Ynk4OTR0THJDeUkyM3hHUUVFdnpjTHM4QUJzaGx6Z2J6UkVMTHcxbUd2?=
 =?utf-8?B?L3hwc1k3ODF1alZmeFJCWXQ5WFZBV3ZCK1hBMEU3QUxmbHBxdXdOb2RtQXox?=
 =?utf-8?B?eERGby9PSWROMDBlWEZNRGVDZW5udmhKdkNkbm93SGtHbk40aXBzYVJMQUtP?=
 =?utf-8?B?TGxpSFIwckFHM0t6dUtOaGpYeVF6cjhLZEtlMEpEaDgzM0l3QzNXam5ZZFFB?=
 =?utf-8?B?bTk2WHZKMVBSdTVzemIxNXhFcUFnOWVrSGlQNTJQTGFTbitQL1ZRTDhYRWgy?=
 =?utf-8?B?Q1NYSVBaaUkrQjl0YkZDV2k4Wk5kNFdPTEhKbzNucmIvNU5EN1h5QnRaWFZ2?=
 =?utf-8?B?WlBrR0VSWFR0cEZ2YVBQdjlHYlFvMWppdnFiY1M1Tk42ODdBMTIxanBkd1ZV?=
 =?utf-8?B?YzNjeXA4eTR1TmlhcnpGNEhnaW1aYjFMeW1qMEkwZjFGTXEvVHRSMHIyWFBY?=
 =?utf-8?B?dlprSE1MTWcrMVdlNHN4bFRoTjk2MEEybDdTTzdNaTIzdmNYbVlTUmRqeDdF?=
 =?utf-8?B?L3lVajljL003Rm1mSGZLMktESThTSkUxOHBUbDk4VzJEODk2cEZnSkM1UkV4?=
 =?utf-8?B?bGFTQnlzQmMrdWxSa1JneElsUExqZ3UwbDFoQkd5eTJuUGxHYnd1ZmlSUUFy?=
 =?utf-8?B?VnpqVW1iMlphZWZJaXJ4c0hCa0QrU3hLQzdvQTFTd202Y3hCa0ZEeXJQWXBX?=
 =?utf-8?B?NTJXcjM3YStQdVdJSUxVKzNxQ2F0Z0o5QUkyMFlZVTV1VkNiQjBpUXlLL2E1?=
 =?utf-8?Q?CdMYBVQ+6zHSbV2isSNHCTHvI6Cc75ePocrGE9Q2ygjWl?=
X-MS-Exchange-AntiSpam-MessageData-1: owHu4+0UlR19hw==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 156dab90-0ace-4992-d299-08df07c01846
X-MS-Exchange-CrossTenant-AuthSource: MW4PR12MB6873.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2026 00:29:33.3823
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: W1VzWPI3+yMP1yd3Qnpjj+GmExh7c/zk8rQ4svak6VhDIT2yAkr9Fsmsolm96pBT0Z6uIyOSWygMBK8UF5uVvw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6349

On Tue, 25 Aug 2026 17:31:17 +0900, Alexandre Courbot wrote:
> The GSP-FMC firmware code lived in `firmware/fsp.rs` and described
> itself as running on the FSP. This is incorrect: GSP-FMC is loaded by
> the FSP, but runs on the GSP as the loader and verifier of GSP-RM. FSP
> secure-boots on its own before the driver even starts.
> 
> Correct the naming and files used to contain the GSP-FMC code, by:
> 
> [...]

Applied to drm-rust-next, thanks!

[1/1] gpu: nova-core: fix incorrect naming/framing of GSP-FMC firmware
[acourbot: drop the documentation change to be picked up by Zhi, reword
 commit message a bit.]
      commit: b705c185105762676aa6ec16cf976101df87cc35
