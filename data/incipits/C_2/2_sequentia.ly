\version "2.24.2"
\include "header.ly"

TromboneI = {
  \relative c' {
    \clef alto
    \key d \minor \time 4/4 \tempoMarkup "Adagio"
    f4. f8 e2
    a,8 d4 d8 h h e e
    c! c cis cis d4 d8 d
    e4 a, f'4. f8
    e e h d cis2
    d8 d4 d8 d cis cis4
  }
}

TromboneII = {
  \relative c' {
    \clef tenor
    \key d \minor \time 4/4 \tempoMarkup "Adagio"
    r2 g4. g8
    g4 f e2
    e4 r r2
    r4 e'8 e a, a d d
    gis,2 a
    r e'4. e8
  }
}

ViolinoI = {
  \relative c' {
    \clef soprano
    \key d \minor \time 4/4 \tempoMarkup "Adagio"
    R1
    a'4. a8 a4 gis
    a4. a8 b!2
    a r
    r4 h8 h e, e a a
    f4 g a r
  }
}

ViolinoII = {
  \relative c' {
    \clef alto
    \key d \minor \time 4/4 \tempoMarkup "Adagio"
    f4. f8 e2
    a,8 d4 d8 h h e e
    c! c cis cis d4 d8 d
    e4 a, f'4. f8
    e e h d cis2
    d8 d4 d8 d cis cis4
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key d \minor \time 4/4 \autoBeamOff \tempoMarkup "Adagio"
    R1
    a'4.^\tutti a8 a4 gis
    a4. a8 b!2
    a r
    r4 h8 h e, e a a
    f4 g a r
  }
}

SopranoLyrics = \lyricmode {
  Di -- es i -- rae,
  di -- es il --
  la
  sol -- vet sae -- clum in fa --
  vil -- _ la:
}

Alto = {
  \relative c' {
    \clef alto
    \key d \minor \time 4/4 \autoBeamOff \tempoMarkup "Adagio"
    f4. f8 e2
    a,8 d4 d8 h h e e
    c! c cis cis d4 d8 d
    e4 a, f'4. f8
    e e h d cis2
    d8 d4 d8 d[ cis] cis4
  }
}

AltoLyrics = \lyricmode {
  Di -- es i --
  rae sol -- vet sae -- clum in fa --
  vil -- la, in fa -- vil -- la, fa --
  vil -- la: Te -- ste
  Da -- vid cum Si -- byl --
  la, te -- ste Da -- vid,
}

Tenore = {
  \relative c' {
    \clef tenor
    \key d \minor \time 4/4 \autoBeamOff \tempoMarkup "Adagio"
    r2 g4. g8
    g4 f e2
    e4 r r2
    r4 e'8 e a, a d d
    gis,2 a
    r e'4. e8
  }
}

TenoreLyrics = \lyricmode {
  Di -- es,
  di -- es il --
  la
  sol -- vet sae -- clum in fa --
  vil -- la:
  Te -- ste
}

Basso = {
  \relative c {
    \clef bass
    \key d \minor \time 4/4 \autoBeamOff \tempoMarkup "Adagio"
    d4.^\tutti d8 d4 cis
    d d e2
    a,4 a'8 a d, d g g
    cis,2 d4 r
    R1
    b'!4. b8 a a e g!
  }
}

BassoLyrics = \lyricmode {
  Di -- es, i -- rae
  di -- es il --
  la sol -- vet sae -- clum in fa --
  vil -- la:

  Te -- ste Da -- vid cum "Si -"
}

Organo = {
  \relative c {
    \clef bass
    \key d \minor \time 4/4 \tempoMarkup "Adagio"
    d2.-\tutti cis4
    d2 e
    a,4 a'8 a d, d g g
    cis,2 d4 \clef tenor d'8 d
    gis,2 a4 r
    \clef bass b!4. b8 a a e g
  }
}

BassFigures = \figuremode {
  r2 <4 2>4 <5>
  <4> <3> <4> <_+>
  <_!> <_+> <6->2
  r1
  <6>2 <_+>
  <5>4 <6> <4>8 <_+> <6\\> <\t>
}

\score {
  <<
    \new StaffGroup <<
      \new GrandStaff <<
        \set GrandStaff.instrumentName = "trb"
        \new Staff {
          \set Staff.instrumentName = "1"
          \TromboneI
        }
        \new Staff {
          \set Staff.instrumentName = "2"
          \TromboneII
        }
      >>
    >>
    \new StaffGroup <<
      \new GrandStaff <<
        \set GrandStaff.instrumentName = "vl"
        \new Staff {
          \set Staff.instrumentName = "1"
          \ViolinoI
        }
        \new Staff {
          \set Staff.instrumentName = "2"
          \ViolinoII
        }
      >>
    >>
    \new ChoirStaff <<
      \new Staff {
        \set Staff.instrumentName = "S"
        \new Voice = "Soprano" { \dynamicUp \Soprano }
      }
      \new Lyrics \lyricsto Soprano \SopranoLyrics

      \new Staff {
        \set Staff.instrumentName = "A"
        \new Voice = "Alto" { \dynamicUp \Alto }
      }
      \new Lyrics \lyricsto Alto \AltoLyrics

      \new Staff {
        \set Staff.instrumentName = "T"
        \new Voice = "Tenore" { \dynamicUp \Tenore }
      }
      \new Lyrics \lyricsto Tenore \TenoreLyrics

      \new Staff {
        \set Staff.instrumentName = "B"
        \new Voice = "Basso" { \dynamicUp \Basso }
      }
      \new Lyrics \lyricsto Basso \BassoLyrics
    >>
    \new StaffGroup <<
      \new Staff {
        \set Staff.instrumentName = \markup \center-column { "org" "b" }
        % \transpose c c,
        \Organo
      }
    >>
    \new FiguredBass { \BassFigures }
  >>
}
