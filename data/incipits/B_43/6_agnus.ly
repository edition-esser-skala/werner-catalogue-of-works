\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key d \minor \time 4/4 \tempoMarkup "Adagio"
    a'8\p a d d b b~ b16 a b8
    a4 d e4.\trill d16 e
    f4 r r2
    R1
    h,4. e4 c a8~
    a fis4 d b' g8
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key d \minor \time 4/4 \tempoMarkup "Adagio"
    f8 f fis fis g g~ g16 f g8
    f4 a c8 g~ g16 f g8
    c,4 r r2
    R1
    e4. gis8 a4 r
    fis8 a4 \hA fis8 g d4 d8
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key d \minor \time 4/4 \autoBeamOff \tempoMarkup "Adagio"
    R1*2
    r8 c'4^\solo c8 f c c c
    f[ d16 cis] d4. c8 h[ a]
    a4 gis a r
    R1
  }
}

SopranoLyrics = \lyricmode {
  Mi -- se -- re -- re, mi -- se --
  re -- _ _ re
  no -- _ bis.
}

Alto = {
  \relative c' {
    \clef alto
    \key d \minor \time 4/4 \autoBeamOff \tempoMarkup "Adagio"
    R1*2
    r8 f4^\solo a8 a4 a
    a4. gis8 a8.[ g16] f4
    e2\trill e4 r
    R1
  }
}

AltoLyrics = \lyricmode {
  Mi -- se -- re -- re,
  mi -- se -- re -- re
  no -- bis.
}

Tenore = {
  \relative c' {
    \clef tenor
    \key d \minor \time 4/4 \autoBeamOff \tempoMarkup "Adagio"
    d4.^\solo a8 b!4 cis
    d8 a d e16 f g8[ e] c[ b]
    gis[ a] a4 r8 f'4 f8
    d4 h a d,
    e2 r
    R1
  }
}

TenoreLyrics = \lyricmode {
  A -- gnus De -- _
  i, qui tol -- lis pec -- ca -- ta
  mun -- di: Mi -- se --
  re -- re no -- _
  bis.
}

Basso = {
  \relative c {
    \clef bass
    \key d \minor \time 4/4 \autoBeamOff \tempoMarkup "Adagio"
    R1*4
    e4.^\solo e8 c'4 a8 c
    d,[ fis] a c b[ g] d[ b]
  }
}

BassoLyrics = \lyricmode {
  A -- gnus De -- i, qui
  tol -- lis pec -- ca -- ta
}

Organo = {
  \relative c {
    \clef bass
    \key d \minor \time 4/4 \tempoMarkup "Adagio"
    d2~-\solo d~
    d c
    f \clef tenor r8 f'4^\aTre f8
    d4 h a d,
    \clef bass e2 a,
    d g,
  }
}

BassFigures = \figuremode {
  <_!>4 <_+> <6- 4> <7\\ 4 2>
  <8 _!>2 <_!>
  r1
  r4 <7>8 <6\\> <4> <_!> <6!> <5>
  <4>4 <_+>2.
  <7 _+>2 <_->
}

\score {
  <<
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
        \Organo
      }
    >>
    \new FiguredBass { \BassFigures }
  >>
}
