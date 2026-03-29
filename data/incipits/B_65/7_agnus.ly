\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key d \dorian \time 4/4 \tempoMarkup "Adagio"
    a'2-\solo g
    f4 g2 a4~
    a d2 c8 h
    a4 gis a2~
    a c~
    c d
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key d \dorian \time 4/4 \tempoMarkup "Adagio"
    f2-\solo e
    a,4 r8 d e2
    f4. f8 h,4 c8 d
    e2 e
    d4 f g2~
    g8 f16 e f2 g8 f~
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key d \dorian \time 4/4 \autoBeamOff \tempoMarkup "Adagio"
    R1*3
    r2 r4 e'8^\solo a,
    f'4 d8 d c[ b16 a] \hA b8 b
    b a r c c4 b8[ a]
  }
}

SopranoLyrics = \lyricmode {
  A -- gnus
  De -- i, qui tol -- lis pec --
  ca -- ta, pec -- ca -- ta
}

Alto = {
  \relative c' {
    \clef alto
    \key d \dorian \time 4/4 \autoBeamOff \tempoMarkup "Adagio"
    R1*6
  }
}

AltoLyrics = \lyricmode {
  %tacet
}

Tenore = {
  \relative c' {
    \clef tenor
    \key d \dorian \time 4/4 \autoBeamOff \tempoMarkup "Adagio"
    r4 a8^\solo d d4 cis8 cis
    d a b4 b a8[ g]
    f d d' h gis4 a8[ h]
    c4 h\trill a r
    R1*2
  }
}

TenoreLyrics = \lyricmode {
  A -- gnus De -- i, qui
  tol -- lis pec -- ca -- ta
  mun -- di: Mi -- se -- re -- re
  no -- _ bis.
}

Basso = {
  \relative c {
    \clef bass
    \key d \dorian \time 4/4 \autoBeamOff \tempoMarkup "Adagio"
    R1*6
  }
}

BassoLyrics = \lyricmode {
  %tacet
}

Organo = {
  \relative c {
    \clef bass
    \key d \dorian \time 4/4 \tempoMarkup "Adagio"
    d2-\solo e
    f4 r8 g cis,2
    d e~
    e4. d8 cis2
    d e
    f4 a, b2
  }
}

BassFigures = \figuremode {
  r2 <7>4 <6\\>
  <6>4. <_->8 <7>4 <6>8 <5>
  <3> <5> <8> <6!> <7 _+>4 <6 4>
  <\t \t> <5 _+> <6>2
  r <6 5->
  <9>8 <8> <6>4 <9> <8 6>8 <\t 5>
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
        \set Staff.instrumentName =  \markup \center-column { "A" "trb 1" }
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
